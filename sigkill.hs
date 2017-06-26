{-# LANGUAGE OverloadedStrings #-}
module Main(main) where
import Control.Arrow (first, (&&&))
import Control.Monad
import Data.Char
import Data.List hiding (group)
import Data.Ord
import Data.Maybe
import Data.Monoid
import System.FilePath
import Text.Blaze.Internal (preEscapedString)
import Text.Blaze.Html5 ((!))
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Text.Blaze.Html.Renderer.String (renderHtml)
import Hakyll
data MenuLevel = MenuLevel { prevItems :: [(FilePath,String)]
                           , aftItems  :: [(FilePath,String)]
                           }
allItems :: MenuLevel -> [(FilePath, String)]
allItems l = prevItems l ++ aftItems l
emptyMenuLevel :: MenuLevel
emptyMenuLevel = MenuLevel [] []
insertUniq :: Ord a => a -> [a] -> [a]
insertUniq x xs | x `elem` xs = xs
                | otherwise = insert x xs
insertItem :: MenuLevel -> (FilePath, String) -> MenuLevel
insertItem l v = case aftItems l of
                   []     -> atPrev
                   (x:xs) | v < x     -> atPrev
                          | otherwise -> l { aftItems = x:insertUniq v xs }
  where atPrev = l { prevItems = insertUniq v (prevItems l) }
insertFocused :: MenuLevel -> (FilePath, String) -> MenuLevel
insertFocused l v = MenuLevel bef (v:aft)
  where (bef, aft) = partition (<v) (delete v $ allItems l)
newtype Menu = Menu { menuLevels :: [MenuLevel] }
emptyMenu :: Menu
emptyMenu = Menu []
showMenu :: Menu -> H.Html
showMenu = zipWithM_ showMenuLevel [0..] . menuLevels
showMenuLevel :: Int -> MenuLevel -> H.Html
showMenuLevel d m =
  H.ul (mapM_ H.li elems) ! A.class_ (H.toValue $ "menu" ++ show d)
  where showElem (p,k) = H.a (H.toHtml k) ! A.href (H.toValue p)
        showFocusElem (p,k) = showElem (p,k) ! A.class_ "thisPage"
        elems = map showElem (prevItems m) ++
                case aftItems m of []     -> []
                                   (l:ls) -> showFocusElem l :
                                             map showElem ls
relevant :: FilePath -> FilePath -> [FilePath]
relevant this other = relevant' (splitPath this) (splitPath other)
  where relevant' (x:xs) (y:ys) = y : if x == y then relevant' xs ys else []
        relevant' [] (y:_) = [y]
        relevant' _ _ = []
buildMenu :: FilePath -> [FilePath] -> Menu
buildMenu this = foldl (extendMenu this) emptyMenu
                 . map (first dropIndex . (id &&& dropExtension . takeFileName))
dropIndex :: FilePath -> FilePath
dropIndex p | takeBaseName p == "index" = dropFileName p
            | otherwise                 = p
extendMenu :: FilePath -> Menu -> (FilePath, String) -> Menu
extendMenu this m (path, name) =
  if path' `elem` ["./", "/", ""] then m else
    Menu $ add (menuLevels m) (relevant this' path') "/"
  where add ls [] _ = ls
        add ls (x:xs) p
          | x `elem` focused = insertFocused l (p++x,name') : add ls' xs (p++x)
          | otherwise        = insertItem l (p++x,name') : add ls' xs (p++x)
          where (l,ls') = case ls of []  -> (emptyMenuLevel, [])
                                     k:ks -> (k,ks)
                name' = if hasTrailingPathSeparator x then x else name
        focused = splitPath this'
        path' = normalise path
        this' = normalise this
routeWithVersion :: Maybe String -> Compiler (Maybe FilePath)
routeWithVersion v = getRoute =<< setVersion v <$> getUnderlying
normalRoute :: Compiler FilePath
normalRoute = fromMaybe "" <$> routeWithVersion Nothing
addToMenu :: Rules ()
addToMenu = version "menu" $ compile $ makeItem =<< normalRoute
getMenu :: Compiler String
getMenu = do
  menu <- map itemBody <$> loadAll (fromVersion $ Just "menu")
  myRoute <- getRoute =<< getUnderlying
  return $ renderHtml $ showMenu $ case myRoute of
    Nothing -> buildMenu "" menu
    Just me -> buildMenu me menu
shDocstring :: String -> String
shDocstring = unlines
              . map (drop 2)
              . takeWhile ("#" `isPrefixOf`)
              . dropWhile (all (`elem` ['#', ' ']))
              . dropWhile ("#!" `isPrefixOf`)
              . lines
cDocstring :: String -> String
cDocstring = unlines
             . map (dropWhile (==' ')
                    . dropWhile (=='*')
                    . dropWhile (==' '))
             . maybe [] lines
             . (return . reverse . cut . reverse
                <=< find ("*/" `isSuffixOf`) . inits
                <=< return . cut
                <=< find ("/*" `isPrefixOf`) . tails)
  where cut s | "/*" `isPrefixOf` s = cut $ drop 2 s
              | otherwise = dropWhile isSpace s
hsDocstring :: String -> String
hsDocstring = unlines
              . map (drop 3)
              . takeWhile ("--" `isPrefixOf`)
              . dropWhile ("#!" `isPrefixOf`)
              . lines
hackCompiler :: Compiler (Item String)
hackCompiler = do
  ext <- getUnderlyingExtension
  src <- itemBody <$> getResourceString
  desc <- return $ case ext of
                    ".c"  -> cDocstring src
                    ".hs" -> hsDocstring src
                    _     -> shDocstring src
  dest <- normalRoute
  desc' <- renderPandoc $ Item ".md" desc
  let name = takeFileName dest
      ctx = constField "name" name <>
            constField "script" dest <>
            constField "description" (itemBody desc')
  loadAndApplyTemplate "templates/hack.html" ctx =<< getResourceString
addHacks :: Item String -> Compiler (Item String)
addHacks item = do
  hacks <- loadAll (fromVersion $ Just "hacks")
  return item { itemBody = itemBody item <> renderHtml (H.ul $ mapM_ asLi hacks) }
  where asLi = H.li . preEscapedString . itemBody
groupPaths :: [Item FilePath] -> [[(FilePath,FilePath)]]
groupPaths = map collapse . groupBy samedir . sortBy (comparing dir)
  where samedir x y = dir x == dir y && dir x /= ["./"]
        dir = take 1 . splitPath . addTrailingPathSeparator . takeDirectory . itemBody
        collapse = map (itemBody &&& toFilePath . itemIdentifier)
configCompiler :: Compiler (Item String)
configCompiler = makeItem =<< dropFirstTwoDirs <$> normalRoute
  where dropFirstTwoDirs = joinPath . drop 2 . splitPath
addConfigs :: Item String -> Compiler (Item String)
addConfigs item = do
  configs <- groupPaths <$> loadAll (fromVersion $ Just "configs")
  return item { itemBody = itemBody item <>
                           renderHtml (H.ul $ mapM_ asLi configs)
              }
  where asLi l = case progname l of
                   Nothing -> return ()
                   Just k | "." `isPrefixOf` k -> return ()
                          | otherwise -> H.li $
                              H.toHtml k >> H.ul (mapM_ disp l)
        disp (c,u) = H.li $ H.a (H.toHtml $ filename c)
                          ! A.href (H.toValue $ '/':u)
        filename c = case splitPath c of
                       []     -> ""
                       [x]    -> x
                       (_:xs) -> joinPath xs
        progname []        = Nothing
        progname ((x,_):_) = Just $ dropTrailingPathSeparator
                                  $ joinPath $ take 1 $ splitPath
                                  $ takeDirectory x
byPattern :: a -> [(Pattern, a)] -> Compiler a
byPattern def options = do
  ident <- getUnderlying
  return $ fromMaybe def (snd <$> find ((`matches` ident) . fst) options)
createByPattern :: Compiler a -> [(Pattern, Compiler a)] -> Compiler a
createByPattern def options = join $ byPattern def options
modifyByPattern :: (b -> Compiler a) -> [(Pattern, b -> Compiler a)] -> b -> Compiler a
modifyByPattern def options x = join $ byPattern def options <*> pure x
contentContext :: Compiler (Context String)
contentContext = do
  menu <- getMenu
  source <- getResourceFilePath
  return $
    defaultContext <>
    constField "menu" menu <>
    constField "source" source
config :: Configuration
config = defaultConfiguration
  { deployCommand = "rsync --chmod=Do+rx,Fo+r --checksum -ave 'ssh -p 22' \
                     \_site/* --exclude pub athas@sigkill.dk:/var/www/htdocs/sigkill.dk"
  }
main :: IO ()
main = hakyllWith config $ do
  match "css/*" $ do
    route   idRoute
    compile compressCssCompiler
  match "files/**" static
  match "images/**" $ do
    route idRoute
    compile copyFileCompiler
  match "pubkey.asc" static
--  let inContentDir = "config/**" .||. "writings/**" .||. "hacks/**" .||.
--                     "programs/**" .||. "projects/**" .||. "*.md"
  let inContentDir = "1-LED/**" .||.  "2-Switches/**" .||.  "3-Sensors/**" .||. "4-Sound/**" .||. "5-Motors/**" .||. "Projects/**" .||. "*.md" 
--  let inContentDir = "MC Boards_Arduino/**" .||.  "MC Boards_ESP8266/**" .||.  "MP Dev Boards/**" .||. "*.md" 
      nothidden = complement "**/.**" .&&. complement ".*/**"
      content = inContentDir .&&. nothidden
      contentPages = content .&&. fromRegex "\\.(md|lhs|man|ico)$"
      contentData = content .&&. complement contentPages
  match contentData static
  match contentPages $ do
    addToMenu
    route $ setExtension "html"
    compile $ do
      context <- contentContext
      createByPattern pandocCompiler [("**.man", manCompiler)]
        >>= modifyByPattern return [("hacks/index.md", addHacks),
                                    ("config/index.md", addConfigs)]
        >>= loadAndApplyTemplate "templates/default.html" context
        >>= relativizeUrls
  match contentPages $ version "source" static
  match "hacks/scripts/*" $ version "hacks" $ compile hackCompiler
  match ("config/configs/**" .&&. nothidden) $ version "configs" $
    compile configCompiler
  match "templates/*" $ compile templateCompiler
static :: Rules ()
static = route idRoute >> compile copyFileCompiler >> return ()
manCompiler :: Compiler (Item String)
manCompiler = getResourceString
              >>= withItemBody (unixFilter "groff" (words "-m mandoc -T utf8")
                                >=> unixFilter "col" ["-b"]
                                >=> return . renderHtml . H.pre . H.toHtml)

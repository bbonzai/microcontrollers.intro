This repository contains materials for the web site:
[worksby.design](http://www.worksby.design), which presents 
teaching materials for Arduino beginners.  These materials were written
for a course called "Introduction to Microcontrollers" offered by 
[Robotics and Beyond](http://www.roboticsandbeyond.org) in its 
2017 summer camp program.

All of the web pages are originally written in (Pandoc) Markdown.  They are 
then converted into web pages using a variant of the static web site generator,
[Hakyll](http://jaspervdj.be/hakyll/).  That variant,
[Sigkill.dk](http://sigkill.dk/programs/sigkill.html), was used because
it added the capability to generate a menu tree.  

The mechanics for doing the  conversion from the files included in this repo to a full web site are in the top-level `Makefile`.

In order to generate the web site yourself, you would need to install the
[Glasgow Haskell Compiler](https://www.haskell.org/ghc/), and run the 
`Makefile`.  If you were to go to all that trouble, you would probably want
to customize the header that goes on every page: `templates/default.html`.


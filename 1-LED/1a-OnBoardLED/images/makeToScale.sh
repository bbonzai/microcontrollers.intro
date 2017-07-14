# Note: -fuzz must precede -transparent!
convert microusb.png -fuzz 1% -transparent '#FDFDE4' -trim microusb-fixed.png
convert usbB2.png -fuzz 1% -transparent '#FDFDE4' -trim usB2-fixed.png
convert usbA.png -fuzz 1% -transparent '#FDFDE4' -trim usbA-fixed.png
convert stdB_to_microusb.svg.png -resize 50% stdB_to_microusb.png
convert stdB_to_stdA.svg.png -resize 50% stdB_to_stdA.png

for f in `seq 1 3`; do latex screen$f; dvips -E -o screen$f.eps; done
convert screen1.eps -resize x250 screen1.png
convert screen3.eps -resize x500 -crop 276x250+0+40 screen3.png
convert screen2.eps -resize x500 -crop 276x250+0+40 screen2.png

 1437  convert stdB_to_stdA.svg.png -resize 500x stdB_to_stdA.svg.png
 1439  convert stdB_to_stdA.svg.png -resize 500x st-crop 100+0 stdB_to_stdA.svg.png
 1440  convert stdB_to_stdA.svg.png -resize 500x -crop 100+0 stdB_to_stdA.svg.png
 1441  convert stdB_to_stdA.svg.png -resize 500x -crop +100x0 stdB_to_stdA.svg.png
 1443  convert stdB_to_stdA.svg.png -resize 500x -crop +80x0 stdB_to_stdA.svg.png
 1445  convert stdB_to_stdA.svg.png -resize 500x -crop +50x0 stdB_to_stdA.svg.png
 1446  convert stdB_to_stdA.svg.png -resize 500x -crop +50x0 stdB_to_stdA2.svg.png
 1451  convert stdB_to_stdA.svg.png -resize 500x -crop +50x0 stdB_to_stdA2.svg.png
 1453  convert stdB_to_stdA.svg.png -resize 500x -crop +100x0 stdB_to_stdA2.svg.png
 1455  convert stdB_to_stdA.svg.png -resize 500x -crop +75x0 stdB_to_stdA2.svg.png
 1500  convert stdB_to_microusb.svg.png -resize 50% stdB
 1503  convert stdB_to_stdA.svg.png -resize 50% stdB_to_stdA.png
 1536  convert stdB_to_microusb.svg.png -resize 50% stdB_to_microusb.png
 1537  convert stdB_to_stdA.svg.png -resize 50% stdB_to_stdA.png

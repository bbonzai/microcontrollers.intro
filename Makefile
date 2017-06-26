# The original file "sigkill.lhs" needs to be customized if you want to
# include or exclude files and directories that are not in the current version.
# Once sigkill.lhs has been modified, you can rebuild the executable using
# this rule.  If so, the Glasgow Haskell compiler (ghc), and you will
# need to have installed hakyll from 
# https://hackage.haskell.org/package/hakyll
build:
	ghc --make sigkill
	./sigkill build

# If you make large modifications to the pages and wish to regenerate
# the whole site, you may want to remove the existng cruft and start clean.
clean:
	rm -rf _site _cache sigkill.o sigkill sigkill.hi

# This just makes a little package so that the site can be quickly
# transported elsewhere.
copy:
	cp -a _site/* /home/sgk/public_html/microcontrollers.intro
	cd /home/sgk/public_html/microcontrollers.intro && tar -czvf /tmp/mi.tgz . 

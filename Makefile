# Lectures

######################################################################

current: target
target = Makefile
-include target.mk
target: $(target)

###################################################################
## Make modules 

mdirs += web

web:
	git submodule add -b master https://github.com/Bio3SS/Bio3SS.github.io.git $@

######################################################################

Sources += Makefile .gitignore README.md sub.mk LICENSE.md
include sub.mk
-include $(ms)/newtalk.def
Sources += $(mdirs)

##################################################################

mfiles = $(mdirs:%=%/Makefile)
mfiles: $(mdirs) $(mfiles)

##################################################################


## Crib

##################################################################

## Formatting
## Script is makestuff/newtalk/lect.pl
## Format rules are in makestuff/newtalk/txt.format _and_
Sources += local.txt.format

## Copyright notice
Sources += copy.tex

######################################################################

## Content

Sources += *.txt

## This is the wrong intro! (An old one from 1M??)
intro.draft.pdf: intro.txt
intro.final.pdf: intro.txt
intro.handouts.pdf: intro.txt
intro.complete.pdf: intro.txt
intro.outline.pdf: intro.txt

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/newtalk.mk
-include $(ms)/newlatex.mk


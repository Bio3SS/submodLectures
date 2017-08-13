# Lectures

######################################################################

current: target
target = Makefile
-include target.mk
target: $(target)

##################################################################

Sources += Makefile .gitignore README.md sub.mk LICENSE.md
include sub.mk
-include $(ms)/newtalk.def

##################################################################

## Crib

old:
	/bin/ln -fs ~/Dropbox/current/WorkingWiki-export/1M_lectures $@

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


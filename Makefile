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

######################################################################

## Content

Sources += *.txt

intro.draft.pdf: intro.txt

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/newtalk.mk
-include $(ms)/newlatex.mk


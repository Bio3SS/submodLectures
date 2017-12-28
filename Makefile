# Lectures

######################################################################

current: target
target = Makefile
-include target.mk
target: $(target)

Drop = ~/Dropbox/courses/3SS

###################################################################
## Make modules 

mdirs += web ts

web:
	git submodule add -b master https://github.com/Bio3SS/Bio3SS.github.io.git $@

ts:
	git submodule add -b master https://github.com/Bio3SS/Population_time_series $@

repodirs += $(mdirs)

######################################################################

## This does not seem ideal.

modules:
	git submodule init
	git submodule update
	$(MAKE) rmpull

######################################################################

Sources += Makefile .gitignore README.md sub.mk LICENSE.md

include sub.mk
-include $(ms)/newtalk.def
-include $(ms)/perl.def

Sources += $(mdirs)

##################################################################

mfiles = $(mdirs:%=%/Makefile)
mfiles: $(mdirs) $(mfiles)

##################################################################

## Formatting
## Script is makestuff/newtalk/lect.pl
## Format rules are in makestuff/newtalk/txt.format _and_
Sources += local.txt.format

## Copyright notice
Sources += copy.tex

######################################################################

## Lectures

Sources += *.txt

intro.draft.pdf: intro.txt
intro.final.pdf: intro.txt
intro.handouts.pdf: intro.txt
intro.complete.pdf: intro.txt
intro.outline.pdf: intro.txt

## %s/images\//webpix\//

######################################################################

## Pix (too many!!)
aging.html: aging.step
competition.html: competition.step
countries.html: countries.step
dandelions.html: dandelions.step
diseases.html: diseases.step
dynamics.html: dynamics.step
ebola.html: ebola.step
evaluation.html: evaluation.step
exploitation.html: exploitation.step
flu.html: flu.step
health.html: health.step
het.html: het.step
hiv.html: hiv.step
humans.html: humans.step
import.html: import.step
journals.html: journals.step
life_history.html: life_history.step
logs.html: logs.step
models.html: models.step
nonlinear.html: nonlinear.step
philosophy.html: philosophy.step
populations.html: populations.step
rabies.html: rabies.step
structure.html: structure.step
units.html: units.step

-include $(ms)/git.mk
-include $(ms)/visual.mk
-include $(ms)/modules.mk

-include $(ms)/newtalk.mk
-include $(ms)/texdeps.mk

-include $(ms)/webpix.mk
-include $(ms)/wrapR.mk


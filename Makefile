# Lectures

######################################################################

current: target
target = Makefile
-include target.mk

###################################################################

## Directories

### Modules 

mdirs += web Bio3SS_content

Sources += popmodules.mk
include popmodules.mk

web:
	git submodule add -b master https://github.com/Bio3SS/Bio3SS.github.io.git $@

exponential:
	git submodule add -b master https://github.com/Bio3SS/Exponential_figures $@

repodirs += $(mdirs)

### Links

my_images: dir=~/Dropbox
my_images: 
	$(linkdir)

######################################################################

## Various imperfect ways of curating the submodules

## Overkill?
modules:
	git submodule init
	git submodule update
	$(MAKE) rmpull

### Not used yet here
mfiles = $(mdirs:%=%/Makefile)
mfiles: $(mdirs) $(mfiles)

######################################################################

Sources += Makefile .gitignore README.md sub.mk LICENSE.md

Drop = Define_image_drop_in_local.mk

include sub.mk
-include $(ms)/newtalk.def
-include $(ms)/perl.def
-include $(ms)/repos.def

Sources += $(mdirs)

##################################################################

## Formatting
## Script is makestuff/newtalk/lect.pl
## Format rules are in makestuff/newtalk/txt.format _and_
Sources += local.txt.format

## Copyright notice
Sources += copy.tex

## Directory-specific latex commands
Sources += pop.tex localcomm.tex

######################################################################

## Lectures

Sources += *.txt

##################################################################

# Cribbing

%.txt:
	perl -npe 's|images/|webpix/|' Bio3SS_content/$@ > $@

## Get rid of this and submodule when done.

######################################################################


# Unit 0 (Intro)

intro.draft.pdf: intro.txt
intro.handouts.pdf: intro.txt

intro.html: intro.step
intro.draft.pdf: intro.txt
intro.final.pdf: intro.txt
intro.handouts.pdf: intro.txt
intro.complete.pdf: intro.txt
intro.outline.pdf: intro.txt

math.handouts.pdf: math.txt
math.complete.pdf: math.txt

# Unit 1 (Linear population growth)

linear.html: linear.step
linear.final.pdf: linear.txt
linear.draft.pdf: linear.txt
linear.handouts.pdf: linear.txt
linear.complete.pdf: linear.txt

######################################################################

## Pix (too many!!)
aging.html: aging.step
competition.html: competition.step
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

######################################################################

## Local makefiles

Sources += $(wildcard *.local)
%.lmk:
	$(CPF) $*.local local.mk

######################################################################

-include $(ms)/visual.mk
-include $(ms)/modules.mk

-include $(ms)/newtalk.mk
-include $(ms)/texdeps.mk

-include $(ms)/webpix.mk
-include $(ms)/wrapR.mk

-include $(ms)/git.mk

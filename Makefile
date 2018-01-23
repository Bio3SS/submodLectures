# Lectures

## https://avenue.cllmcmaster.ca/d2l/lms/news/newedit.d2l?ou=235353
## Need to activate (cryptic) each year:
	## Course admin/course offering information/active (then save)

######################################################################

current: target
target = Makefile
-include target.mk

###################################################################

## Directories

### Modules 

## A special module (should probably be a clone)
specdirs += web

Sources += popmodules.mk
include popmodules.mk

web:
	git submodule add -b master https://github.com/Bio3SS/Bio3SS.github.io.git $@

clonedirs += wayback
wayback:
	git clone -b 2017 https://github.com/Bio3SS/Bio3SS.github.io.git $@

pushdir = web/materials

## repodirs have auto-making rules from modules.mk
## mdirs are used by recursive git rules
repodirs += $(specdirs)
mdirs = $(specdirs)

ORPHAN = Bio3SS_content

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

Sources += Makefile .ignore README.md sub.mk LICENSE.md

## Keeping track of schedule
Sources += lectures.txt

## See .lmk rule
Drop = Define_image_drop_in_local.mk

include sub.mk
-include $(ms)/newtalk.def
-include $(ms)/perl.def
-include $(ms)/repos.def

Sources += $(mdirs)

##################################################################

## Formatting
## Script is makestuff/newtalk/lect.pl
## Old 3SS rules are in makestuff/lect/lect.format
## Current rules are in makestuff/newtalk/txt.format _and_
Sources += local.txt.format

## Copyright notice
Sources += copy.tex

## Directory-specific latex commands
Sources += pop.tex localcomm.tex

######################################################################

## Lectures

Sources += $(wildcard *.txt *.poll)

##################################################################

# Cribbing

## %.txt:
%.txt:
	perl -npe 's|images/|webpix/|' Bio3SS_content/$@ > $@

## :%s/SSLIDE/PICSLIDE/

%.poll:
	cat Bio3SS_content/$@ > $@

## Get rid of this section and the Bio3SS_content submodule when done.
## Oops, already refactored that submodule ☹

## Images

my_images/%:
	$(CP) ~/Dropbox/$@ $@

######################################################################

# Unit 1 (Intro)

intro.pollnew: 
intro.pollclean: 
intro.poll.csv: intro.txt pollcsv.pl
intro.html: intro.step
intro.outline.pdf: intro.txt

intro.draft.pdf: intro.txt
intro.final.pdf: intro.txt
intro.handouts.pdf: intro.txt
intro.complete.pdf: intro.txt

math.handouts.pdf: math.txt
math.complete.pdf: math.txt

# Unit 2 (Linear population growth)
linear.pollnew: 
linear.pollclean: 
linear.poll.csv: linear.txt pollcsv.pl
linear.html: linear.step
linear.outline.pdf: linear.txt

linear.final.pdf: linear.txt
linear.draft.pdf: linear.txt
linear.handouts.pdf: linear.txt
linear.complete.pdf: linear.txt

# Unit 3 (Non-linear population growth)
nonlinear.pollnew: 
nonlinear.pollclean: 
nonlinear.poll.csv: nonlinear.txt pollcsv.pl
nonlinear.html: nonlinear.step
nonlinear.outline.pdf: nonlinear.txt

nonlinear.final.pdf: nonlinear.txt
nonlinear.draft.pdf: nonlinear.txt
nonlinear.handouts.pdf: nonlinear.txt
nonlinear.complete.pdf: nonlinear.txt

######################################################################

Sources += $(wildcard *.pl)

### Not using pollclean this year (auto-linking isn't working)
### Instead I just open a whole bunch of polls in chrome during setup
### Change POLL to NEWPOLL automatically (get rid of everywhere links)
%.pollnew: %.txt
	perl -pi -e 's/\bPOLL\b\s*\S*/NEWPOLL /' $<

### Change NEWPOLL back to POLL once link is added
%.pollclean: %.txt
	perl -pi -e "s|NEWPOLL.*?everywhere.com/|POLL |" $<

## Poll conversion
Ignore += *.poll.csv
%.poll.csv: %.txt pollcsv.pl
	$(PUSH)


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
jd.lmk:
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

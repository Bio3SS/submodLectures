# Lectures

## https://avenue.cllmcmaster.ca/d2l/home/273939
## Request
	##  http://avenue.mcmaster.ca/course/course_request_check.php
## Activate (cryptic):
	## Course admin/course offering information/active (then save)

######################################################################

current: target
-include target.mk

Sources = Makefile README.md LICENSE.md

ms = makestuff
Sources += $(ms)

Makefile: $(ms)/Makefile
	touch $@

$(ms)/%.mk: $(ms)/Makefile
	touch $@

$(ms)/Makefile:
	git submodule update -i $(ms) 
	touch $@

-include $(ms)/os.mk
-include $(ms)/perl.def

###################################################################

## Directories

### Modules 

## A special module (should probably be a clone)
## Resting! investigate
Ignore += $(specdirs)

Sources += popmodules.mk
include popmodules.mk

## Move up one level. Use?
## clonedirs += wayback

clonedirs += WA_Ebola_Outbreak

pushdir = ../web/materials

## repodirs have auto-making rules from modules.mk
## mdirs are used by recursive git rules
## repodirs += $(specdirs)
## mdirs = $(specdirs)

mdirs += age bd_models boxes compensation competition dd exploitation exponential life_history life_tables sims structure ts

hotdirs += $(mdirs) $(clonedirs)
Sources += $(mdirs)

######################################################################

## Keeping track of schedule
Sources += lectures.txt

## See .lmk rule
Drop = Define_image_drop_in_local.mk

-include $(ms)/newtalk.def
-include $(ms)/perl.def
-include local.mk
## -include $(ms)/repos.def

Sources += $(mdirs)

##################################################################

## Formatting
## Script is talkdir/lect.pl
## Current rules are in talkdir/txt.format _and_
Sources += local.txt.format

## Copyright notice
Sources += copy.tex

## Directory-specific latex commands
Sources += pop.tex localcomm.tex

######################################################################

## Lectures

Sources += $(wildcard *.txt *.poll)

##################################################################

## Images (pull necessary from an old, bigger my_images)

my_images/%:
	$(CP) ~/Dropbox/$@ $@

######################################################################

sandbox.draft.pdf: sandbox.txt

# Unit 1 (Intro)

intro.pollnew: 
## intro.pollclean: 
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
## linear.pollclean: 
linear.poll.csv: linear.txt pollcsv.pl
linear.html: linear.step
linear.outline.pdf: linear.txt

linear.final.pdf: linear.txt
linear.draft.pdf: linear.txt
linear.handouts.pdf: linear.txt
linear.complete.pdf: linear.txt

# Unit 3 (Non-linear population growth)
nonlinear.pollnew: 
## nonlinear.pollclean: 
nonlinear.poll.csv: nonlinear.txt pollcsv.pl
nonlinear.html: nonlinear.step
nonlinear.outline.pdf: nonlinear.txt

nonlinear.final.pdf: nonlinear.txt
nonlinear.draft.pdf: nonlinear.txt
nonlinear.handouts.pdf: nonlinear.txt
nonlinear.complete.pdf: nonlinear.txt

# Unit 4 (Structured populations)
structure.pollnew: 
## structure.pollclean: 
structure.poll.csv: structure.txt pollcsv.pl
structure.html: structure.step
structure.outline.pdf: structure.txt

structure.final.pdf: structure.txt
structure.draft.pdf: structure.txt
structure.handouts.pdf: structure.txt
structure.complete.pdf: structure.txt

# Unit 5 (Life history)
life_history.pollnew: 
## life_history.pollclean: 
life_history.poll.csv: life_history.txt pollcsv.pl
life_history.html: life_history.step
life_history.outline.pdf: life_history.txt

life_history.final.pdf: life_history.txt
life_history.draft.pdf: life_history.txt
life_history.handouts.pdf: life_history.txt
life_history.complete.pdf: life_history.txt

# Unit 6 (competition)
competition.pollnew: 
## competition.pollclean: 
competition.poll.csv: competition.txt pollcsv.pl
competition.html: competition.step
competition.outline.pdf: competition.txt

competition.final.pdf: competition.txt
competition.draft.pdf: competition.txt
competition.handouts.pdf: competition.txt
competition.complete.pdf: competition.txt

# Unit 7 (exploitation)
exploitation.pollnew: 
## exploitation.pollclean: 
exploitation.poll.csv: exploitation.txt pollcsv.pl
exploitation.html: exploitation.step
exploitation.outline.pdf: exploitation.txt

exploitation.draft.pdf: exploitation.txt
exploitation.final.pdf: exploitation.txt
exploitation.handouts.pdf: exploitation.txt
exploitation.complete.pdf: exploitation.txt

# Unit 8 (Disease)
disease.pollnew: 
## disease.pollclean: 
disease.poll.csv: disease.txt pollcsv.pl
disease.html: disease.step
disease.outline.pdf: disease.txt

disease.final.pdf: disease.txt
disease.draft.pdf: disease.txt
disease.handouts.pdf: disease.txt
disease.complete.pdf: disease.txt

######################################################################

## Note chopping

day1.txt: intro.txt Makefile
	perl -npe "last if /Example/" $< | perl -npe "s/CHAPTER.*/CHAPTER Day 1 complete notes/" > $@
day1.complete.pdf: intro.txt

######################################################################

Sources += $(wildcard *.pl)

### NEWPOLL was fun, but probably too fancy. 
### The only real advantage is to put poll links into the notes
### For lecture, just open a whole bunch of polls during setup

### Change POLL to NEWPOLL automatically (get rid of everywhere links)
%.pollnew: %.txt
	perl -pi -e 's/\bPOLL\b\s*\S*/NEWPOLL /' $<

### Not using pollclean this year (auto-linking isn't working)

### Change NEWPOLL back to POLL once link is added
%.pollclean: %.txt
	perl -pi -e "s|NEWPOLL.*?everywhere.com/|POLL |" $<

## Poll conversion
## Use semi-colons for MC
## | for separation (or ?; will that work for pdf outputs?)
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
-include $(ms)/hotcold.mk

-include $(ms)/newtalk.mk
-include $(ms)/texdeps.mk

-include $(ms)/webpix.mk
# -include $(ms)/wrapR.mk

-include $(ms)/git.mk

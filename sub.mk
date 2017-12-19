ms = makestuff
-include local.mk
-include $(ms)/os.mk

Sources += $(ms)

Makefile: $(ms) $(ms)/Makefile
makestuff:
	git submodule add -b master https://github.com/dushoff/$@.git

makestuff/Makefile: makestuff
	git submodule init $(ms) 
	git submodule update $(ms) 
	touch $@


mdirs += ts exponential bd_models compensation life_tables life_history age structure competition exploitation boxes dd sims

## Missing: ebola. Get things straight

ts:
	git submodule add -b master https://github.com/Bio3SS/Population_time_series $@
exponential:
	git submodule add -b master https://github.com/Bio3SS/Exponential_figures $@
bd_models:
	git submodule add -b master https://github.com/Bio3SS/Birth_death_models $@
compensation:
	git submodule add -b master https://github.com/Bio3SS/Compensation_models $@
life_tables:
	git submodule add -b master https://github.com/Bio3SS/Life_tables $@
life_history:
	git submodule add -b master https://github.com/Bio3SS/Life_history $@
age:
	git submodule add -b master https://github.com/Bio3SS/Age_distributions $@
structure:
	git submodule add -b master https://github.com/Bio3SS/Structured_models $@
competition:
	git submodule add -b master https://github.com/Bio3SS/Competition_models $@
exploitation:
	git submodule add -b master https://github.com/Bio3SS/Exploitation_models $@
boxes:
	git submodule add -b master https://github.com/dushoff/SIR_model_family $@
dd:
	git submodule add -b master https://github.com/mac-theobio/Disease_data $@
sims:
	git submodule add -b master https://github.com/dushoff/SIR_simulations $@



.PHONY: format
# Variables
fvm := false

# Check if fvm option is enabled
FVM_ARG :=
FVM_OPT :=
ifeq ($(fvm),true)
    FVM_ARG := --fvm
    FVM_OPT := fvm
endif

# Targets
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done

format: ## Format and analyze the code
	@$(FVM_ARG) flutter pub run import_sorter:main
	@$(FVM_ARG) dart format lib/ test/
	@$(FVM_ARG) flutter analyze
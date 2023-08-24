
.PHONY: init format get build run
# Variables
fvm := 0

# Check if fvm option is enabled
FVM_OPT :=
ifeq ($(fvm),1)
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

init: get build

format: ## Format and analyze the code
	@$(FVM_OPT) flutter pub run import_sorter:main
	@$(FVM_OPT) dart format lib/ test/
	@$(FVM_OPT) dart analyze

get:
	@$(FVM_OPT) flutter pub get

build:
	@$(FVM_OPT) flutter pub run build_runner build --delete-conflicting-outputs

run:
	@echo "╠ Running the app..."
	$(FVM_OPT) flutter run
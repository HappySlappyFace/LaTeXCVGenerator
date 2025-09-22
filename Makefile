# Makefile to manage company-specific CV variants
# Usage examples:
#   make DSLab            # clones Default -> CompanySpecific/DSLab and sets \companyname{DSLab}
#   make EXPERTDEV        # switches to EXPERTDEV (cloning from Default on first use)
#   make switch COMPANY=Acme
#   make list             # list existing companies

COMPANY?=Default
COMPANY_DIR=CompanySpecific/$(COMPANY)
DEFAULT_DIR=CompanySpecific/Default

.PHONY: switch list help %

# Pattern target: calling `make CompanyName` triggers a switch to that company
%:
	@$(MAKE) --no-print-directory switch COMPANY="$@"

# Explicit target to perform the switch/clone and update main.tex
switch:
	@mkdir -p CompanySpecific
	@if [ ! -d "$(DEFAULT_DIR)" ]; then \
		echo "ERROR: $(DEFAULT_DIR) does not exist. Create your template first."; \
		exit 1; \
	fi
	@if [ ! -d "$(COMPANY_DIR)" ]; then \
		echo "Cloning template: $(DEFAULT_DIR) -> $(COMPANY_DIR)"; \
		cp -r "$(DEFAULT_DIR)" "$(COMPANY_DIR)"; \
	else \
		echo "Using existing company folder: $(COMPANY_DIR)"; \
	fi
	@# Update the company variable in main.tex
	@sed -i 's|\\def\\companyname{[^}]*}|\\def\\companyname{$(COMPANY)}|' main.tex
	@echo "Switched company to: $(COMPANY)"

list:
	@echo "Existing companies under CompanySpecific/:"
	@ls -1 CompanySpecific || true

help:
	@echo "Targets:"
	@echo "  make <CompanyName>   -> Clone Default to that company (if missing) and set \\companyname in main.tex"
	@echo "  make switch COMPANY=X -> Same as above using an explicit variable"
	@echo "  make list            -> List existing companies"

DIRNAME ?= new_directory

# List of files to copy (excluding the template)
FILES = atsGen.tex resume.tex bash.sh

# Default target
all: create_directory compile_pdfs

# (3) Target to list templates and prompt for selection
select_template:
	@echo "Available templates in the 'templates' directory:"
	@bash -c 'files=($$(ls templates/)); \
	for i in "$${!files[@]}"; do \
		echo "$$((i+1)). $${files[$$i]}"; \
	done; \
	echo "Enter the number of the template to use: "; \
	read num; \
	selected_template=$${files[$$((num-1))]}; \
	echo $$selected_template > template.txt'


# (4) Target to create the directory, copy files, and include the selected template
create_directory: select_template
	@echo "Enter the directory name (press Enter to use '$(DIRNAME)'): "; \
	read input; \
	dirname=$${input:-$(DIRNAME)}; \
	echo $$dirname > dirname.txt; \
	mkdir -p $$dirname; \
	cp $(FILES) $$dirname/; \
	cp templates/`cat template.txt` $$dirname/; \
	echo "DIRNAME=$$dirname" > $$dirname/.env

# (5) Target to compile .tex files using bash.sh
compile_pdfs: create_directory
	@echo "Generating PDFs in `cat dirname.txt`..."
	@(cd `cat dirname.txt` && chmod +x bash.sh)

# (6) Target to clean the directory
clean:
	rm -rf `cat dirname.txt`
	rm -f dirname.txt
	rm -f template.txt

.PHONY: all select_template create_directory compile_pdfs clean


# Default directory name
DIRNAME ?= new_directory

# List of files to copy
FILES = atsGen.tex desc.tex resume.tex bash.sh

# Default target
all: create_directory compile_pdfs

# Target to create the directory and copy files
create_directory:
	@echo "Enter the directory name (press Enter to use '$(DIRNAME)'): "; \
	read input; \
	if [ -n "$$input" ]; then \
		echo $$input > dirname.txt; \
	else \
		echo $(DIRNAME) > dirname.txt; \
	fi; \
	mkdir -p `cat dirname.txt`; \
	cp $(FILES) `cat dirname.txt`/; \
	echo "DIRNAME=`cat dirname.txt`" > `cat dirname.txt`/.env

# Target to compile .tex files using bash.sh
compile_pdfs: create_directory
	@echo "Generating PDFs in `cat dirname.txt`..."
	@(cd `cat dirname.txt` && chmod +x bash.sh && ./bash.sh)

# Target to clean the directory
clean:
	rm -rf `cat dirname.txt`
	rm -f dirname.txt

.PHONY: all create_directory compile_pdfs clean


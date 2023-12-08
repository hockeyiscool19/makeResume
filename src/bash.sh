#!/bin/bash

# Define the path to the .env file based on the current script directory
ENV_PATH="./.env"

# Check if the .env file exists and source it
if [ -f "$ENV_PATH" ]; then
    source "$ENV_PATH"
else
    echo "ERROR: .env file not found in $ENV_PATH."
    exit 1
fi

# Compile resume.tex and rename the output PDF
if [ -f "resume.tex" ]; then
    xelatex resume.tex
    mv resume.pdf "Eisenman, Jordan -- $DIRNAME.pdf"
else
    echo "ERROR: resume.tex not found."
fi

# Compile atsGen.tex and rename the output PDF
if [ -f "atsGen.tex" ]; then
    xelatex atsGen.tex
    mv atsGen.pdf "Eisenman, Jordan (A) -- $DIRNAME.pdf"
else
    echo "ERROR: atsGen.tex not found."
fi

# Remove unnecessary files
rm -f *.aux *.bcf *.log *.out *.run.xml


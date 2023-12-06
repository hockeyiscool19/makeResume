#!/bin/bash

# Define the path to the .env file based on the current script directory
ENV_PATH="./.env"

# Read the DIRNAME variable from .env
if [ -f "$ENV_PATH" ]; then
  source "$ENV_PATH"
else
  echo "ERROR: .env file not found in $ENV_PATH."
  exit 1
fi

# Compile resume.tex and rename the output
xelatex resume.tex
mv resume.pdf "Eisenman, Jordan -- $DIRNAME.pdf"

# Compile atsGen.tex and rename the output
xelatex atsGen.tex
mv atsGen.pdf "Eisenman, Jordan (A) -- $DIRNAME.pdf"

evince "Eisenman, Jordan (A) -- $DIRNAME.pdf" &

# Remove unnecessary files
rm -f *.aux *.bcf *.log *.out *.run.xml


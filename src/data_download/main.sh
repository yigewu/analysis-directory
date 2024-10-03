#!/bin/bash

# Set variables
outputDir="../../data/raw/"

#For downloading from URL
url=
outputFileName=
wget -cO - ${url} > ${outputDir}${outputFileName}

#For downloading from GEO
## The FTP address can be found by clicking one of the files in the "Download family" section
geo_dir=
geo_accession=
wget --recursive --no-parent -nd ftp://ftp.ncbi.nlm.nih.gov/geo/series/${geo_dir}/${geo_accession}/ -P ${outputDir}

# Change to the output directory
cd "${outputDir}"

# Create the unzipped directory if it doesn't exist
mkdir -p unzipped

# Loop through all files in the current directory
for file in *; do
	# Check if it's a regular file
	if [ -f "$file" ]; then
		case "$file" in
			*.zip)
				# Unzip .zip files
				unzip -q "$file" -d "unzipped/${file%.*}"
				;;
			*.tar)
				# Extract .tar files
				mkdir -p "unzipped/${file%.*}"
				tar -xf "$file" -C "unzipped/${file%.*}"
				;;
			*.gz)
				# Extract .gz files
				mkdir -p "unzipped/${file%.*}"
				gunzip -c "$file" > "unzipped/${file%.*}/${file%.gz}"
				;;
		esac
	fi
done

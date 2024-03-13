#!/bin/bash

# Set variables
outputDir="../../data/raw/"

#For downloading from URL
url=
outputFileName=
wget -c0 - ${url} > ${outputDir}${outputFileName}

#For downloading from GEO
geo_dir=
geo_accession=
wget --recursive --no-parent -nd ftp://ftp.ncbi.nlm.nih.gov/geo/series/${geo_dir}/${geo_accession}/ -P ${outputDir}

# If file is .zip file, unzip
cd ${outputDir}
if [ "${outputFileName: -4}" == ".txt" ]; then
	unzip ${outputFileName}
fi

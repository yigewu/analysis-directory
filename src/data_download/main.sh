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

cd ${outputDir}
# If file is .zip file, unzip
if [ "${outputFileName: -4}" == ".zip" ]; then
	unzip ${outputFileName}
fi
# If file is .tar file
if [ "${outputFileName: -4}" == ".tar" ]; then
	mkdir -p ${outputFileName}.out
	tar -xvf ${outputFileName} -C ${outputFileName}.out
fi
# If file is .gz file
if [ "${outputFileName: -4}" == ".gz" ]; then
	gunzip ${outputFileName}
fi

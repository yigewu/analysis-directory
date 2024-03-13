#For downloading from URL
url=
outputFileName=
wget -c ${url} -P ../../data/raw -O ${outputFileName}

#For downloading from GEO
geo_dir=
geo_accession=
wget --recursive --no-parent -nd ftp://ftp.ncbi.nlm.nih.gov/geo/series/${geo_dir}/${geo_accession}/ -P ../../data/raw/

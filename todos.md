# Protocol to create a new analysis directory inside of experiments (delete this section after cloning)
```
## Git clone
git clone https://github.com/yigewu/analysis-directory.git
## Make directory accessible by RStudio Server
chmod -R 777 analysis-directory/
## Rename directory
mv analysis-directory/ {name_of_your_analysis}
## Make sure the analysis directory is no longer a git repository
cd {name_of_your_analysis}
rm -r -f .git
```

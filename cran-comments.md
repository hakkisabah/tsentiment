## Test environments
* local R installation, R 4.1.0
* ubuntu 16.04 (on travis-ci), R 4.1.0
* win-builder (devel)
* Debian 10 (buster), R 4.1.0

## R CMD check results

0 errors | 0 warnings | 1 note

* After Kurt Hornik's return a policy violation, file save transactions has been corrected as 'tools::R_user_dir()' and a confirmation message has been added for the user's file operations

* Change APIinfo global assign behaviour to env

* Major changes applied

* Please check the latest version posted, not the old one.

* Package name removed from description start.

* tsentiment_1.0.1.tar.gz is still on the waiting list

* remove example for createFolder function

## 27.11.2021 COMMENTS

* PLEASE READ THIS : You are getting a CRAN db warning about "Does not clean up ~/.local/share/R/tsentiment". It has been fixed in the new version, even if you don't care, a lot of unnecessary time was spent suspecting other situations. Everything is working great now, and I should also mention that every time a new analysis is started in the local tsentiment folder, the previous files are deleted. But if I delete that folder or its contents, how will users be able to see the analysis results? I think I have followed most of the steps for create the extension as described in the package creation steps.

## 03.11.2021 COMMENTS for version 1.0.5

* syuzhet package is use spread_() method included of tidyr, spread_() also deprecated from last version of tidyr package. In conclusion, may be show warning but it's not related tsentiment package.


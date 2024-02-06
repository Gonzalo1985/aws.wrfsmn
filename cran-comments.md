## R CMD check results

For a CRAN submission we recommend that you fix all NOTEs, WARNINGs and ERRORs.
## Test environments
- R-hub windows-x86_64-devel (r-devel)
- R-hub ubuntu-gcc-release (r-release)
- R-hub fedora-clang-devel (r-devel)

## R CMD check results
❯ On windows-x86_64-devel (r-devel)
  checking CRAN incoming feasibility ... [11s] NOTE

❯ On windows-x86_64-devel (r-devel), ubuntu-gcc-release (r-release), fedora-clang-devel (r-devel)
  checking dependencies in R code ... NOTE
  Namespace in Imports field not imported from: 'qpdf'
    All declared Imports should be used.

❯ On windows-x86_64-devel (r-devel)
  checking for non-standard things in the check directory ... NOTE
  Found the following files/directories:
    ''NULL''

❯ On windows-x86_64-devel (r-devel)
  checking for detritus in the temp directory ... NOTE
  Found the following files/directories:
    'lastMiKTeXException'

❯ On ubuntu-gcc-release (r-release)
  checking CRAN incoming feasibility ... [6s/19s] NOTE
  Maintainer: ‘Gonzalo Diaz <gonzalomartindiaz22@gmail.com>’
  
  New submission
  
  Possibly misspelled words in DESCRIPTION:
    Meteorologico (8:17)
    Nacional (8:31)
    Servicio (8:8)
    SMN (3:27, 8:41)

❯ On ubuntu-gcc-release (r-release), fedora-clang-devel (r-devel)
  checking HTML version of manual ... NOTE
  Skipping checking HTML validation: no command 'tidy' found

❯ On fedora-clang-devel (r-devel)
  checking CRAN incoming feasibility ... [6s/24s] NOTE
  Maintainer: ‘Gonzalo Diaz <gonzalomartindiaz22@gmail.com>’
  
  New submission
  
  Possibly misspelled words in DESCRIPTION:
    Meteorologico (8:17)
    Nacional (8:31)
    SMN (3:27, 8:41)
    Servicio (8:8)

0 errors ✔ | 0 warnings ✔ | 7 notes ✖

* This is a new release.

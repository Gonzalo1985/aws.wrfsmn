## R CMD check results
❯ On windows-x86_64-devel (r-devel)
  checking whether package 'aws.wrfsmn' can be installed ... [18s] WARNING
  Found the following significant warnings:
    Warning: replacing previous import 'dplyr::lag' by 'stats::lag' when loading 'aws.wrfsmn'
    Warning: replacing previous import 'dplyr::filter' by 'stats::filter' when loading 'aws.wrfsmn'
    Warning: replacing previous import 'lubridate::intersect' by 'terra::intersect' when loading 'aws.wrfsmn'
    Warning: replacing previous import 'lubridate::origin' by 'terra::origin' when loading 'aws.wrfsmn'
    Warning: replacing previous import 'lubridate::union' by 'terra::union' when loading 'aws.wrfsmn'
  See 'C:/Users/USERJGqEutWayP/aws.wrfsmn.Rcheck/00install.out' for details.

❯ On ubuntu-gcc-release (r-release)
  checking whether package ‘aws.wrfsmn’ can be installed ... [22s/47s] WARNING
  Found the following significant warnings:
    Warning: replacing previous import ‘dplyr::lag’ by ‘stats::lag’ when loading ‘aws.wrfsmn’
    Warning: replacing previous import ‘dplyr::filter’ by ‘stats::filter’ when loading ‘aws.wrfsmn’
    Warning: replacing previous import ‘lubridate::intersect’ by ‘terra::intersect’ when loading ‘aws.wrfsmn’
    Warning: replacing previous import ‘lubridate::origin’ by ‘terra::origin’ when loading ‘aws.wrfsmn’
    Warning: replacing previous import ‘lubridate::union’ by ‘terra::union’ when loading ‘aws.wrfsmn’
  See ‘/home/docker/aws.wrfsmn.Rcheck/00install.out’ for details.

❯ On fedora-clang-devel (r-devel)
  checking whether package ‘aws.wrfsmn’ can be installed ... [23s/52s] WARNING
  Found the following significant warnings:
    Warning: replacing previous import ‘dplyr::lag’ by ‘stats::lag’ when loading ‘aws.wrfsmn’
    Warning: replacing previous import ‘dplyr::filter’ by ‘stats::filter’ when loading ‘aws.wrfsmn’
    Warning: replacing previous import ‘lubridate::intersect’ by ‘terra::intersect’ when loading ‘aws.wrfsmn’
    Warning: replacing previous import ‘lubridate::origin’ by ‘terra::origin’ when loading ‘aws.wrfsmn’
    Warning: replacing previous import ‘lubridate::union’ by ‘terra::union’ when loading ‘aws.wrfsmn’
  See ‘/home/docker/aws.wrfsmn.Rcheck/00install.out’ for details.

❯ On windows-x86_64-devel (r-devel)
  checking for non-standard things in the check directory ... NOTE
  Found the following files/directories:
    ''NULL''

❯ On windows-x86_64-devel (r-devel)
  checking for detritus in the temp directory ... NOTE
  Found the following files/directories:
    'lastMiKTeXException'

❯ On ubuntu-gcc-release (r-release), fedora-clang-devel (r-devel)
  checking HTML version of manual ... NOTE
  Skipping checking HTML validation: no command 'tidy' found

0 errors ✔ | 3 warnings ✖ | 3 notes ✖

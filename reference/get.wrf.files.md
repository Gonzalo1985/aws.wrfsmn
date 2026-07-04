# List of available files for downloading

Character string with the filenames of WRF SMN located in AWS Bucket

## Usage

``` r
get.wrf.files(year = year, month = month, day = day, cycle = cycle, time = time)
```

## Arguments

- year:

  character or numeric of year

- month:

  character or numeric of month

- day:

  character or numeric of day

- cycle:

  cycle of forecast, "00", "06", "12" or "18"

- time:

  selection of datasets, "01H", "24H" or "10M"

## Value

string of the list of elements in the Bucket

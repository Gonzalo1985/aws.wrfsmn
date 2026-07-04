# Load and projection of data

Open of netcdf files of WRF SMN from AWS and optional projection

## Usage

``` r
load.by.variable(nc.filenames, variable, transform, method)
```

## Arguments

- nc.filenames:

  netcdf files

- variable:

  name of variable from
  https://odp-aws-smn.github.io/documentation_wrf_det/Formato_de_datos/
  as character

- transform:

  TRUE to project data to longlat datum=WGS84

- method:

  if transform is set TRUE define projection method taken from project
  function of terra package

## Value

Spat Raster with the chosen variable (optional: with the projection
changed)

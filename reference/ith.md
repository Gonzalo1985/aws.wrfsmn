# Calculation of ITH index

ITH index calculation is made from gridded observational or model data.
If the data is needed in lat/lon projection is better to use first the
load.by.variable function to change projection

The index is calculated as:

\$\$ITH = 1.8 \* T(ºC) + 32 - (((0.55 - (0.55 \* RelHum(\\))) / 100) \*
((1.8 \* T(ºC)) - 26))\$\$

where T(ªC) is the temperature in celsius degrees and RelHum(%) is the
relative humidity in percentage

## Usage

``` r
ith(raster.list = raster.list)
```

## Arguments

- raster.list:

  Spat Raster variable with several variables and times or only one Spat
  Raster field

## Value

Spat Raster with ITH calculation for each time

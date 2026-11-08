---
title: 'aws.wrfsmn: A R package for Data Processing of SMN Hi-Res Weather Forecast from AWS'
tags:
  - R
  - atmospheric sciences
  - numerical weather prediction
  - WRF model
authors:
  - name: Gonzalo M. Diaz
    orcid: 0009-0003-9056-4896
    equal-contrib: true
    affiliation: "1, 2" # (Multiple affiliations must be quoted)
affiliations:
 - name: National Meteorological Service, Buenos Aires, Argentina
   index: 1
 - name: Department of Atmospheric and Ocean Sciences, Facultad de Ciencias Exactas y Naturales, University of Buenos Aires, Argentina
   index: 2
date: 08 November 2026
bibliography: paper.bib

# Optional fields for papers that are part of a joint submission.
# For example, submitting to a AAS journal too, see this blog post:
# https://blog.joss.theoj.org/2018/12/a-new-collaboration-with-aas-publishing
#
# If you are not making a joint submission you should remove these lines.
#
# aas-doi: 10.3847/xxxxx <- update this with the DOI from AAS once you know it.
# aas-journal: Astrophysical Journal <- The name of the AAS journal.
---

# Summary

In atmospheric sciences or meteorology, one of the most important activities, and one of the best known to the general public, is weather forecasting. This activity relies on obtaining and analyzing the outputs of numerical weather prediction (NWP) models. Developed countries make global NWP models outputs available to countries around the world. However, the spatial resolution of these models is often insufficient to adequately represent local atmospheric phenomena. Therefore, the National Meteorological Service of Argentina (SMN-Arg) runs its own high-resolution regional model to produce higher-quality forecasts. This model is the Weather Research and Forecasting (WRF) Model, and SMN-Arg makes some of its products available through AWS services ([SMN Hi-Res Weather Forecast over Argentina](https://registry.opendata.aws/smn-ar-wrf-dataset/)). In addition, some of the model's output atmospheric variables are statistically calibrated using past events.

This publication introduces an R package designed to provide the following functionalities: downloading WRF data from AWS services; querying data by variable; retrieving data for specific locations; transforming daily data into monthly values; applying statistical procedures to calibrate atmospheric variables; and calculating specialized indices relevant to sectors such as agriculture.

# Statement of need

The `aws.wrfsmn` package was developed in the R programming language due to its widespread use as an open-source language within SMN-Arg. The idea behind the development of the package came from the need to make better use of the information provided by the WRF Model across the different departments of SMN-Arg, particularly those involved in the Meteorological and Climate Services and Applications Department.

On the other hand, the package is also useful for technical users outside SMN-Arg who have a scientific and technical background and knowledge of relatively straightforward statistical methods. As an open-source software package, it is continuously improved and updated in response to the needs of both internal SMN-Arg users and external users. The development version is freely available at @awswrfsmn

One of the most evident needs among internal users of SMN-Arg was to have access to a package that would allow them to quickly visualize the output of the WRF model run by SMN-Arg. To address this need, the package relies on `terra` as one of its core dependencies, as it was designed to facilitate the handling and processing of geospatial data. `terra` offers extensive functionality for processing, analyzing, and extracting spatial raster data, including gridded meteorological fields.

Finally, some of the variables available on AWS have been calibrated using past events [@Righetti:2022], [@Cutraro:2020]. However, other variables have not been calibrated, and the package provides functions to perform station-level calibration based on simple statistical methods [@Diaz:2023].

# State of the field

Several R packages are available for meteorological data processing and analysis:\
- `metR` (@metR): Provides tools for meteorological data analysis and visualization, including contouring, vector fields, and derived atmospheric variables.\
- `verification` (@verification): Provides statistical methods for evaluating deterministic and probabilistic forecasts against observations.

Other packages, such as `ecmwfr` and `rnoaa`, facilitate access to meteorological and climate datasets from international data providers. A wide variety of R packages are available for processing meteorological and climate data. However, none combines statistical methods for calibrating model outputs with the calculation of specific meteorological indices tailored to users' needs.

# Overview of the package

The `aws.wrfsmn` package is organized into four sections of functions: (1) downloading and querying WRF model data (by variable and location), (2) visualizing fields and performing temporal transformations of the data, (3) applying statistical post-processing techniques to calibration model outputs at specific locations, and (4) calculating sector-specific indicators from WRF model data.

Figure 1 shows all the package functions organized by section. The order reflects a typical workflow for using the package; however, it does not imply that this is the only way to use it, as the workflow will also depend on the user's goals and needs.

The last section is still under active development. Therefore, it currently includes only one function, which calculates basic biometeorological indices of interest for livestock production (Figure 1). The long-term goal is to expand this section of the package by developing functions to calculate other types of sector-specific indices according to users’ needs.

![Figure 1: Section overview of the aws.wrfsmn package](JOSS_pub.jpg){width="100%"}

As supplementary material, the package includes a dataset containing evaporation data, which can be loaded using the eva command (once the package is called). The header of this dataset is shown below:

```{r}
library('aws.wrfsmn')
head(eva)
```

The test dataset contains three years of observed evaporation records for a specific location in Argentina (the evapo_obs column), along with several columns containing outputs from a land surface model (the Variable Infiltration Capacity \[VIC\] model). This dataset is intended to allow users to run the calibration functions described in Section (3) and perform tests if desired (Figure 1). This material is available in the function vignettes or package articles ([aws.wrfsmn article](https://gonzalo1985.github.io/aws.wrfsmn/articles/Multiple-Linear-Regression-Correction.html)) and on personal GitHub pages ([aws.wrfsmn Code Tips Hub](https://gonzalo1985.github.io/CodeTipsHub/Evaporation-soil-model-calibration/)).

# WRF output visualization and forecasts at a specific location

The following example shows how to download files from the SMN-Arg WRF model run and perform a quick visualization of the outputs as a raster map and a time series. Only the functions from Section (1) are used in this example.

First, we use the function that lists the files available for download from the AWS bucket. WRF runs are initialized four times per day. In this example, we select the 00Z run using the cycle parameter. The time parameter specifies the temporal frequency of the output files (other temporal frequencies are available for atmospheric variables in the bucket):
```{r}
library('aws.wrfsmn')

files <- get.wrf.files(
  year = 2026,
  month = 10,
  day = 25,
  cycle = "00",
  time = "01H"
)

head(files)
```

In this case, there are 73 time steps. Once the files available in the bucket have been listed, we proceed to download them (only the first 9 times are selected):
```{r}
wrf.download(wrf.name = files[1:9])
```

Once the files have been downloaded, a single atmospheric variable is loaded from the dataset, in this case, temperature. The rasters are also reprojected using bilinear interpolation to latlon projection:
```{r}
temperature <- load.by.variable(
  nc.filenames = list.files(pattern = "\\.nc$"),
  variable = "T2",
  transform = TRUE,
  method = "bilinear"
)
```

The nine temperature fields are finally visualized using the plot() function from the `terra` package:
```{r}
terra::plot(temperature)
```

The final part shows how to extract the time series at a specific point within the model domain and plot it as a time series using `ggplot2`:
```{r}
library('ggplot2')

tmp.series <- find.nearest.point(
  data.spat.raster = temperature,
  lon = -61.53258,
  lat = -30.95686
)

df <- data.frame(
  time = terra::time(temperature),
  tmp.data = t(tmp.series[3:11])
)

ggplot(data = df, aes(x = time, y = tmp.data)) +
  geom_line() +
  labs(
    title = "Temperature time series at a specific location",
    x = "Time",
    y = "Temperature (ºC)"
  )
```

# Last words

The WRF model is used at the regional scale in Argentina, specifically, within the operational activities of the SMN-Arg. To facilitate its use, the `aws.wrfsmn` package provides a set of functions that allow users to handle these data in a simple and straightforward manner, with the support of the `terra` package. However, `aws.wrfsmn` is not limited to data processing, as it was also developed with the aim of enabling users to perform basic statistical analyses to generate model calibration at specific locations of interest.

Future developments will focus on improving and expanding the calculation of sectoral indices, as well as incorporating statistical analyses based on the model climatology. These developments will make it possible to assess meteorological extremes, particularly excesses and deficits in different meteorological variables.

# AI usage disclosure

No generative AI tools were used in the development of this software, the writing of this manuscript, or the preparation of supporting materials.

# Acknowledgements

We acknowledge contributions from Brigitta Sipocz, Syrtis Major, and Semyeong Oh, and support from Kathryn Johnston during the genesis of this project.

# References
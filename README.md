# aws.wrfsmn R package
This R package (library) was created to handle WRF SMN data obtained from Amazon (AWS) services (https://registry.opendata.aws/smn-ar-wrf-dataset/). The operational version can be obtained from https://cran.r-project.org/web/packages/aws.wrfsmn/index.html.

## Package Installation
### Option 1
First, the repository containing the files needed to install the package must be cloned. From an OS terminal, run the following command:
```
$ git clone https://github.com/Gonzalo1985/aws.wrfsmn
```

From the folder cloned with the files of the repository, execute the following command from an R console:
```{r, echo = TRUE, results = FALSE}
devtools::install()
```

### Option 2
From an R console run the following command:
```{r, echo = TRUE, results = FALSE}
devtools::install_github("Gonzalo1985/aws.wrfsmn")
```

Contact: Gonzalo M. Díaz (gonzalomartindiaz22@gmail.com)

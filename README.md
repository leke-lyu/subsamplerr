
<!-- README.md is generated from README.Rmd. Please edit that file -->

# subsamplerr

<!-- badges: start -->
<!-- badges: end -->

Following the approach of [Anderson F.
Brito](https://www.cell.com/cell/fulltext/S0092-8674(21)00434-7), we
developed R scripts, later consolidated into an R package. This package
processes case count tables and genome metadata, enabling visual
exploration of sampling heterogeneity and the implementation of
proportional sampling schemes.

## Installation

You can install the development version of subsamplerr from GitHub with:

``` r
devtools::install_github("leke-lyu/subsamplerr")
```

## Workflow Overview

### Input Data

- **texasSeqMeta**: Metadata of genome samples in Texas by location and
  date.
- **texasCase**: Daily case counts in Texas.

### Data Processing

- **metaTableToMatrix**: Converts `texasSeqMeta` into a matrix format by
  location and date.
- **dateToEpiweek**: Aggregates both genome and case data from daily
  counts to weekly counts.

### Heterogeneity Analysis

- **plotSequencingRatio**: Generates a visualization to inspect the
  sampling heterogeneity in the Texas dataset.

### Proportional Sampling

- **proposedSamplingMatrix**: Creates a sampling matrix based on a
  baseline ratio (0.006).
- **proportionalSampling**: Applies the sampling matrix to select a
  proportionate sample from `texasSeqMeta`.

### Post-sampling Heterogeneity Analysis

- **plotSequencingRatio**: Re-evaluates sampling heterogeneity in the
  sampled dataset for comparison with the original dataset.

## Example

``` r
library(subsamplerr)

texasSeq <- texasSeqMeta %>% metaTableToMatrix(., "location", "date") %>% dateToEpiweek(.)
texasCase %<>% dateToEpiweek(.)
```

``` r
plotSequencingRatio(texasSeq, texasCase)
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

``` r
texasSample <- proposedSamplingMatrix(0.006, texasSeq, texasCase)
id <- proportionalSampling(texasSample, texasSeqMeta)
#> [1] "Given the basline equals 0.006, 5899 genomes are sampled."
#> .
#>     Dallas-Fort Worth               Houston           San Antonio 
#>                  1835                  1523                   593 
#>                 rural                Austin               McAllen 
#>                   516                   465                   113 
#>        Corpus Christi  Beaumont-Port Arthur               Killeen 
#>                   102                    84                    78 
#>           Brownsville Bryan-College Station               El Paso 
#>                    66                    60                    57 
#>               Lubbock                  Waco                 Tyler 
#>                    48                    48                    43 
#>              Amarillo                Laredo               Midland 
#>                    38                    32                    29 
#>         Wichita Falls               Sherman                Odessa 
#>                    26                    25                    24 
#>              Longview               Abilene              Victoria 
#>                    23                    22                    21 
#>             Texarkana            San Angelo 
#>                    15                    13
```

``` r
plotSequencingRatio(texasSample, texasCase)
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

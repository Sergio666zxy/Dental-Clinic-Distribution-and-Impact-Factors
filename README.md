# Spatial Distribution and Impact Factors of Private Dental Practices: Evidence from Chinese major cities

This is the replication codes of tables and figures of the manuscript entitled Spatial Distribution and Impact Factors of Private Dental Practices: Evidence from Chinese major cities.

This repository is consists of three main parts:

1. statistical result parts;
2. figure parts;
3. regression analysis parts.

The statistical analysis contains a STATA do-file, designed to regenerate the statistical summary presented in Table 1 of our study. This do-file facilitates a comprehensive comparison of mean differences with or without private dental clinics in each grid.

The figures part contains the codes that can be used to replicate the Figure 1, Figure 2 and Figure 3. (note that Figure 1 (A) is plotted using QGIS, so it can not be directly replicated in code)

1. [figure 1.ipynb](https://github.com/Sergio666zxy/Spatial-Distribution-and-Impact-Factors-of-Private-Dental-Practices-Evidence-from-China/blob/main/figures/figure%201.ipynb) is the python code that can replicate the histogram of percentages of different types of public hospitals relative to all the types of dental clinics in each city. The data used to reproduce this figure is the year 2022 in our study period.
2. [figure 2.R](https://github.com/Sergio666zxy/Spatial-Distribution-and-Impact-Factors-of-Private-Dental-Practices-Evidence-from-China/blob/main/figures/figure%202.R) uses the standard deviational ellipse to plot the distribution of the private dental clinics in each area.
3. [figure 3.R](https://github.com/Sergio666zxy/Spatial-Distribution-and-Impact-Factors-of-Private-Dental-Practices-Evidence-from-China/blob/main/figures/figure%203.R) plots the distribution of 1km*1km grids that we use in our study, and the color represents the housing price in logarithm form in various areas.
4. [figure 4.ipynb](https://github.com/Sergio666zxy/Spatial-Distribution-and-Impact-Factors-of-Private-Dental-Practices-Evidence-from-China/blob/main/figures/figure%204.ipynb) is the python code to replicates the number of private dental clinics in each city of 2016-2022 in city wide data.

The regression analysis part contains the python code that can replicate the table 2-3. Note that the table 4.xlsx and table 3.xlsx is combined to a single table in the original paper. The notebook starts with a Moran's I index examnination and then conduct various techiniques in regresssions, including random effect, fixed effect and spatial lagged with fixed effect model. Then it conducts heterogenous tests and robustness tests.

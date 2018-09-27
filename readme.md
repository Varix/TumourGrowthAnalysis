# Mixed Model Anova Tumour Analysis for TIG / NCARD

This script was written for the Tumour Immunology Group part of the National Centre for Asbestos Related Diseases. It is intended for researchers to compare tumour growth between treatment groups without having to know how to program or use the models. This script generates a text file with the mixed Model Anova Type 3, KR-method and Estimated Marginal Means.

Traditional anovas when comparing at different time points and using repeated measures increase the type 1 error in the analysis without the researcher necessarily being aware of it. This statistical approach allows you to avoid this.

For reference and analysis on this issue, see: Heitjan DF, Manni A and Santen RJ, 1993, Statistical analysis of in vivo tumor growth experiments. Cancer Res, 53, 6042–50

## Getting Started

i) install libraries as required in script (Working on adding a pre-loader that does this for you)

1) Replace the filename var's section with the desired name of your output file.

	- Your Output File Name
	- Your Long form data frame
	- Your Treatment Group Numbers

2) Run the line:
```
OutputAnalysis(TumourData)
```
3) Thats it!!


### Prerequisites

R / R Studio

## Built With

* [afex](https://cran.r-project.org/web/packages/afex/afex.pdf) - Factorial Analysis
* [emmeans](https://cran.r-project.org/web/packages/emmeans/emmeans.pdf) - Estimated Marginal Means
* [lme4](https://cran.r-project.org/web/packages/lme4/lme4.pdf) - Linear Mixed-Effects Models


## Authors

* **Wes Wilson** - *Initial work* - [Varix](https://github.com/Varix)


## Usage

If you use this script, or fork it, would be great if you could cite or acknowledgement me in your paper. Thanks!

## Acknowledgments

A big thank you to Ian Dick for double checking my math.

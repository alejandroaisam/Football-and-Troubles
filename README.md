# Sports and nationalism: assessing the effect of football in *The Troubles*

Git Hub repository for the master's thesis on the effect of football in the troubles.

Each markdown of the repository accounts for a particular task of the process. The workflow can be summarised as follow:

## 0. Finding data Sources

### 0.1. Data for the dependent and independent variables

-   Data on protest is obtained from Ron Francisco's webpage. All original databases can be downloaded from [here](https://ronfran.ku.edu/data/index.html).

-   Cliftonville FC data provided by Haydn Milligan, creator of the [Irish League Archive](https://www.irishleaguearchive.org/).

-   Matches of Derry City FC obtained from [Extratime.com](https://www.extratime.com/teams/results/7/derry-city/?results=1987).

### 0.2. Data for the control variables.

-   Socio-economic data obtained from [UKCensus](https://www.nomisweb.co.uk/).

-   Religious data obtained from [Cain Archives](https://cain.ulster.ac.uk/index.html).

## 1. Harvesting & Cleaning

This step allows to gather the data from the original sources and prepare it for the future featuring. In general, this step mostly focus on standardizing the various databases: renaming variables and providing time and location information to the data. 

## 2. Aggregating

At this step, the different dataframes are merged into an unified table; independent, dependent and control variables are joined into a single file. The result is the final dataframe which accounts for the desired unit of observation: week-district.

## 3. Descriptive analysis

The first section of the analysis on the effect of football in the troubles entails a descriptive approach. It serves to comprehend the evolution in time of protests. Two main visualization analyses are carried out:

-   Time Series analysis (TimeSeries.Rmd): a visualization depicting the number of protests per month in three contexts: Northern Ireland, Derry and Belfast.

-   Geographical analysis (MapViz.Rmd and AnimatedMaps.Rmd): A map construction representing the number of protests per year in each district.


## 4. Cliftonville FAC analysis

The second section of the analysis is the empirical analysis of the effect of football matches in protests during *The Troubles*. For that, various generalized linear models are constructed (Models.Rmd):

-   Logistic regressions: three models that calculate the odds of protests taking place when Cliftonville plays at home and/or wins a match.

-   Negative binomial regression: a generalized linear model that calculates the increase in the expected number of protests when Cliftonville plays at home and/or wins a match.

-   Zero-Inflated negative binomial model: a final model that combines the previous two. In a first stage it calculates whether a week-district observation witnessed protests. In a second step it calculates the increase in expected number of protests. In both cases the independent variables are used to predict the outcome.

## 5. Derry City FC analysis

Descriptive analysis featuring the return of Derry City to the top division in the Republic of Ireland. Two new visualizations are added to the analysis: 

- Time series depicting the number of protests in Northern Ireland, considering only the period 1983-1990. 

- Geographical representation of the number of protests per district in four different periods: 

Additionally, a regression discontinuity design and a instrumental variable models are constructed to evaluate the causal effect of this return (RDD_IV.R/Annex I in the thesis). 
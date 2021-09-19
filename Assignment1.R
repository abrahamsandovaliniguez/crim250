# Title: Assignment 1
# Date: 9/15/2021
# Author: Abraham Sandoval Iniguez

library(datasets)
# install.packages("datasets")
USArrests
dat <- USArrests
dat$state <- tolower(rownames(USArrests))
names(dat)
# The 5 variables are murder, assault, urbanpop, rape, and state
# According to the DVB reading, murder would be a quantitative variable within this particular context.
# Murder is a UNIVARIATE NON-GRAPHICAL variable in R.
# The dataset's variables compare the incidents or rates of murder, assault, and rape along state lines, as well as those of urban population sizes. Given the tenths decimal places featured in the categories of murder and rape, it is safe to assume those numbers present rates of reported incidents as neither murder nor rape can occur to a tenth degree. Assault, on the contrary, appears to be reported as raw, reported incidents given the data is presented as whole integers. The state category lists the various American states, adjacent to each states' urban population. As a note, the urban population data is presented seemingly as either proportional integers or on a scale; to illustrate, any one state's urban population data may identify what percentage of the state's population lives in an urban center. 
par(mfrow=c(3,1))
dat$Murder
hist(dat$Murder, main="Frequency of State Murder Rates", xlab="Murder Rate Per [X] People", ylab="Number of States", xlim=c(0,20), col="maroon", breaks=10, xaxp=c(0,20,10))
summary(dat)
# The mean for murder is 7.788, which is the average of all state murder rates; the median of 7.25 is in contrast the figure at the middle of the string of variables if sequenced. The quartiles are the percentiles of the data. Combined, both the 1st and 3rd quartile depict where half the data lies betwee. That is, 25% of states have murder rates below 4.075, the 1st Quartile, while 75% of states have murder rates are less than 11.25. Likewise, 75% of states have murder rates higher than 4.075 and 25% of states have a murder rate higher than 11.25; 50% of states would thus have a murder rate between 4.075 and 11.25. R must provide the percentiles or quartiles to depict where half of the data lies between, presenting a numerical bell curve of sorts.
dat$Assault
hist(dat$Assault, main="Frequency of States' Reported Assaults", xlab="Incidents of Assault", ylab="Number of States", xlim=c(0,400), col="darkorange", breaks=10, xaxp=c(0,400,8))
summary(dat)

dat$Rape
hist(dat$Murder, main="Frequency of State Rape Rates", xlab="Rape Rate Per [X] People", ylab="Number of States", xlim=c(0,20), col="brown", breaks=10, xaxp=c(0,20,10))
summary(dat)

# install.packages("maps")
# install.packages("ggplot2")
library('maps') 
library('ggplot2') 

ggplot(dat, aes(map_id=state, fill=Murder)) + 
  geom_map(map=map_data("state")) + 
  expand_limits(x=map_data("state")$long, y=map_data("state")$lat)
# The code generates a map of the United States where each state is shaded according to their murder rate. States with darker shadings have lower murder rates as those with ligher shades have higher murder rates. The install commands download the graphed data, that is they download a map and hold the manipulated data. The ggplot command then creates the graph by loading the "dat" variable, which was predefined as the US Arrest data. The map is then divided along state lines and shaded according to the murder rate, per the map_id and fill command respectively. The geom_map command allows for additional manipulation to the states' borders, defining each state alongside existing state boundaries. Finally, the expand_limits command expands the graph by manipulating the x and y axes.

#A quantitative spatial-temporal analysis of groundwater levels of Lahore, Punjab, Pakistan
#Set working directory
setwd("~/Documents/Dissertation Data/Man Kendall Files")

#Install packages
install.packages("trend")
library("trend")
install.packages('modifiedmk')
library("modifiedmk")
install.packages("dplyr")
library("dplyr")
install.packages("ggpubr")
library("ggpubr")

#Install Data
#EXAMPLE will be our GWL file
EXAMPLE <- read.csv(file= "EXAMPLE.csv", header=T,sep=",")

#Assessing Suitability of data for trend analysis
shapiro.test(EXAMPLE$GWL)
ggqqplot(EXAMPLE$GWL)
ggdensity(EXAMPLE$GWL)

#Linear regression
# Perform linear regression and store the results
regression <- lm(EXAMPLE$GWL ~ EXAMPLE$YEAR)

# Print the slope coefficient from the regression
summary(regression)$coefficients[2, 1]
regression <- lm(EXAMPLE$GWL ~ EXAMPLE$YEAR)

plot(EXAMPLE,
     pch = 16,
     cex = 1.3,
     col = "blue",
     main = "113",
     xlab = "Year",
     ylab = "mBGL")
grid(ny=20)
lm(EXAMPLE$GWL ~ EXAMPLE$YEAR)
abline(lm(EXAMPLE$GWL ~ EXAMPLE$YEAR))

#Block BS MK
bbsmk(EXAMPLE$GWL, ci=0.95, nsim=2000, eta=1, bl.len=NULL)




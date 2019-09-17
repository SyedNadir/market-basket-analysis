
#######################################################################################################
## Welcome - NAFIS Data Science Course 2017 -- Association Rules  # Apriori
#######################################################################################################

## Mo Medwani
## 
## Welcome to NAFIS Data Science Course 2nd batch - May 13th to August 12th 2017
##
## In this section we will learn how to build Apriori Model

#######################################################################################################
### Free memory Functions
#######################################################################################################

# Clear environment
rm(list = ls()) 

# Clear packSalarys
pacman::p_unload(rgl)

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L


#######################################################################################################
### Working Directory
#######################################################################################################

# Set your working directory to save an R file: 
# setwd("/Users/YourName/Desktop") 
# OR Session < Top Level Menu Item >  Set Working Directory
getwd()
setwd("D:/Data Science/git projects/market-basket-analysis/anlytics using R")

# #######################################################################################################
# ### Loading Data to RStudio
# ######################################################################################################## 
# 
# Trans = read.csv('merged_customer_baskets.csv', header = FALSE)
# # remove first row & first column (customerid)
# Trans = Trans[-1,-1]
# #now dataframe have data in "basket" format, save it in Transactions.csv for apriori algorithm
# write.csv(Trans, file = 'Transactions.csv')
# 
# str(Trans) # structure
# 
# names(Trans) # variable names
# attributes(Trans)
# 
# dim(Trans) # dimensions
# 
# nrow(Trans) # number of observations
# dim (Trans)[1]
# 
# ncol(Trans) # number of variables
# 
# summary(Trans)
# 
# #######################################################################################################
# ### Find Duplicate records 
# #######################################################################################################
# 
# duplicated(Trans)
# anyDuplicated(Trans)
# anyDuplicated(Trans, fromLast = TRUE)
# Trans[36001,]
#######################################################################################################
## Data Preprocessing
#######################################################################################################

install.packages('arules')
library(arules)

Trans = read.transactions('Transactions.csv', sep = ',', rm.duplicates = TRUE)

# check density, most frequent items & itemset/transaction distribution
summary(Trans)

# plot top 50 most frequent items
itemFrequencyPlot(Trans, topN = 50)

#######################################################################################################
## Training Apriori on the Trans
#######################################################################################################

rules = apriori(data = Trans, parameter = list(support = 0.004, confidence = 0.2))

#######################################################################################################
## Visualising the results
#######################################################################################################

inspect(sort(rules, by = 'lift')[1:10])



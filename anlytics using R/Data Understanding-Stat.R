#######################################################################################################
### Free memory
#######################################################################################################

# Clear environment
rm(list = ls()) 

# Clear packages
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
setwd("D:/Data Science/Projects/Market Basket Analysis")

#######################################################################################################
### Loading Data to RStudio
######################################################################################################## 

transactionData = read.csv('customer_baskets.csv')

#set customer_id to Null
transactionData$customer_id <- NULL

#rename column name to items
colnames(transactionData) <- c("items")

#now dataframe have data in "basket" format
head(transactionData)
tail(transactionData)
names(transactionData)

# # convert transaction data to structured "sparsity matrix"
# install.packages('arules', dependencies = TRUE)
# library('arules')
# CbasketSM <- read.transactions("customer_baskets.csv", 
#                                format = "basket", 
#                                header = TRUE, 
#                                sep = ",",
#                                cols = c(1),
#                                rm.duplicates = TRUE)
# library('dplyr')
# glimpse(CbasketSM)
# str(CbasketSM)
# 
# library('psych')
# describe(CbasketSM)
# summary(CbasketSM)
# head(CbasketSM)

#convert it into transaction object
tr <-as(transactionData, "transactions")
tr
summary(tr)

# Number of items purchased = rows * columns * density = 36316 * 34384 * 2.09e-05 = ?

# item frequency plot - Absolute
library('RColorBrewer')
itemFrequencyPlot(tr, topN = 20, type = "absolute", col=brewer.pal(8,'Pastel2'), main='absolute item frequency plot')

#relative frequency
itemFrequencyPlot(tr, topN = 20, type = "relative", col=brewer.pal(8,'Pastel2'), main='relative item frequency plot')

head(tr@itemInfo)
names(tr@itemInfo)

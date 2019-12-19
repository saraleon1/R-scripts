
# Import data and double check its structure
data <- read.csv("impressions.csv")
summary(data)
head(data)
str(data)
levels(data$region)

ggpairs(data=data, columns=c(1,2,7), title="global data")



# Break Data Regionally - Focus on Germany
data_germany <- data[data$region == "germany",]
head(data_germany)

ggpairs(data=data_germany, columns=c(1,2,7), title="germany data")


# Initial Plot of the data
ggplot(data_germany, aes(x = budget,
                    y = impressions)) +
  geom_point() +
  geom_smooth(method = "lm")   # add trendline using linear model

# boxplots --> Check for Outliers
par(mfrow=c(1, 2))  # divide graph area in 2 columns
boxplot(data_germany$impressions, main="Impressions")  # box plot for 'impressions'
boxplot(data_germany$budget, main="Budget")  # box plot for 'budget'

better_data_germany <- data_germany[data_germany$budget < 5000 & data_germany$impressions < 3000000,]

ggplot(better_data_germany, aes(x = budget,
                         y = impressions)) +
  geom_point() +
  geom_smooth(method = "lm") 

ggpairs(data=better_data_germany, columns=c(1,2,7), title="germany data")




# build linear model
lm_mod1 <- lm(impressions ~ 0 + budget, data = better_data_germany)
# look at our model with summary function
summary(lm_mod1)


lm_mod2 <- lm(impressions ~ 0 + budget * days, data = better_data_germany)
summary(lm_mod2)
plot(lm_mod2)

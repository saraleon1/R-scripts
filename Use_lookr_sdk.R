# Basic Examples of How to Run the LookR SDK
# This allows you to use the Looker API with the R Programming Language
# Uses the Open-Source SDK located here: https://github.com/looker-open-source/lookr
# Script Written by Sara Leon, September 14th 2019



# -----------------------------------------------------------------------------------------------------
# Authenticate into Looker API by running the looker.ini config file:


# Set your working directory to where your looker.ini file is
setwd("<path to my file>")
getwd()

# Initialize the looker.ini file
sdk <- LookerSDK$new(configFile = "looker.ini")

# Check whether the user is authenticated
sdk$isAuthenticated() # should print TRUE --> can run queries through lookr


# -----------------------------------------------------------------------------------------------------

# Get a list of all models in instance that the user has access to
sdk$allModels()


# -----------------------------------------------------------------------------------------------------

# Run a look and get the data 
data <- sdk$runLook(lookId = 123) # Change 123 to any lookerID (can be found in the look's URL)
look_as_dataframe <- rbindlist(data) # NOTE that rbindlist requires the data.table libary
look_as_dataframe
str(look_as_dataframe)

# -----------------------------------------------------------------------------------------------------

# Run a Query and get the data
data123 <- sdk$runInlineQuery(model = "ecommerce",
                           view = "users",
                           fields = c("users.id","users.first_name ", "users.count"),
                           limit = 50)


# Use rbindlist to get the nested list into a dataframe (requires the library data.table)
mydata <- rbindlist(data123)
mydata
str(mydata)  # confirms its a dataframe, as it has different types for each column

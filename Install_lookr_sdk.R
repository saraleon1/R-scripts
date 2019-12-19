# Steps to Set Up the LookR SDK
# This allows you to use the Looker API with the R Programming Language
# Uses the Open-Source SDK located here: https://github.com/looker-open-source/lookr
# Script Written by Sara Leon, September 14th 2019


# enable devtools
library(devtools)

# download the looker R sdk from github using devtools
devtools::install_github("looker/lookr")

# enable the looker R repository /  package
library(lookr)


# install / update R6 package, which contains the LookerSDK
install.packages("R6")

# enable the R6 package
library(R6)
?LookerSDK

# After creating the looker.ini file, check you're in the correct wd and initialize that file
setwd("<file path>")
getwd()
sdk <- LookerSDK$new(configFile = "looker.ini")

# Check whether the user is authenticated
sdk$isAuthenticated()

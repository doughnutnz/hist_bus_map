###########################################################
# Entry point of the app
#
# Author: Doug Hunt
# Created: 2018-11-18
###########################################################


library(shiny)
library(shinydashboard)
library(shinyWidgets)
# library(shinycssloaders)
library(shinyjs)
library(rintrojs)
# library(highcharter)
library(dplyr)
library(httr)
library(jsonlite)
library(jqr)
library(leaflet)
library(assertthat)



# Load utilities ----------------------------------------------------------

# source all global utilities
source("utils/ui-utils.R")

# source in the API helpers
source("utils/at_api.R")


# Load modules ------------------------------------------------------------

source("modules/bus_map/global.R")
source("modules/help/global.R")


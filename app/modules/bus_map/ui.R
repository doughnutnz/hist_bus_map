###########################################################
# UI definitions of the BUS_MAP module
#
# Author: Doug Hunt
# Created: 2018-11-18
###########################################################

bus_mapModuleUI <- function(id) {
  # obtain namespace
  ns <- NS(id)

  tagList(
    div(
      id = ns("headline-help"),
      h3("Bus Map")
    ),
    fluidRow(
      column(
        width = 8,
        div(
          id = ns("time_slider-help"),
          sliderInput(
            ns("time_slider"), 
            label = "Select time", 
            min = 1, max = 10, 
            value = 1,
            animate = TRUE,
            width = "100%"
          )
        )
      ),
      column(width = 4, h4(textOutput(ns("retrieval_time")))),
      column(
        width = 12,
        div(
          id = ns("map-help"),
          leafletOutput(ns("map"))
        )
      )
    )
  )
}

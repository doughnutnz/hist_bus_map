###########################################################
# Help descriptions of the BUS_MAP module
#
# Author: Doug Hunt
# Created: 2018-11-18
###########################################################


bus_mapModuleHelp <- function(id) {
  ns <- NS(id)

  help_defs <- list(
    list(
      id = ns("headline-help"),
      help = "Some help message specific to the Bus Map module"
    ),
    list(
      id = ns("time_slider-help"),
      help = "Nice slider!"
    ),
    list(
      id = ns("map-help"),
      help = "Super map!"
    )
    
  )

  data.frame(
    element = lapply(help_defs, function(x) paste0("#", x$id)) %>% unlist(),
    intro = lapply(help_defs, function(x) x$help) %>% unlist()
  )
}

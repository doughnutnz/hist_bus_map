###########################################################
# Help descriptions of the HELP module
#
# Author: Doug Hunt
# Created: 2018-11-18
###########################################################


helpModuleHelp <- function(id) {
  ns <- NS(id)

  help_defs <- list(
    list(
      id = ns("headline-help"),
      help = "Some help message specific to the Help module"
    )
  )

  data.frame(
    element = lapply(help_defs, function(x) paste0("#", x$id)) %>% unlist(),
    intro = lapply(help_defs, function(x) x$help) %>% unlist()
  )
}

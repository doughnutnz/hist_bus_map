###########################################################
# UI definitions of the HELP module
#
# Author: Doug Hunt
# Created: 2018-11-18
###########################################################

helpModuleUI <- function(id) {
  # obtain namespace
  ns <- NS(id)

  tagList(
    # TODO: add UI elements here
    div(
      id = ns("headline-help"),
      h3("Help")
    )
  )
}

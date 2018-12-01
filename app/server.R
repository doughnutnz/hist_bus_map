###########################################################
# Global server logic of the application
#
# Author: Doug Hunt
# Created: 2018-11-18
###########################################################


shinyServer(
  function(input, output, session) {

    # call modules to add functionality of dashboard tabs
    callModule(bus_mapModule, "bus_map_module")
    callModule(helpModule, "help_module")

    # handle help messages
    observeEvent(input$intro, {
      if (input$tabs == "bus_map") {
        introjs(session, options = list(steps = bus_mapModuleHelp("bus_map_module")))
      }
      if (input$tabs == "help") {
        introjs(session, options = list(steps = helpModuleHelp("help_module")))
      }
    })
  }
)

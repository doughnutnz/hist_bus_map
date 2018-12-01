###########################################################
# Server logic of the BUS_MAP module
#
# Author: Doug Hunt
# Created: 2018-11-18
###########################################################

# Module server function
bus_mapModule <- function(input, output, session) {

  # Initialisation ----------------------------------------------------------

  # obtain namespace
  ns <- session$ns
  

  # Bus map -----------------------------------------------------------------

  # create empty map
  output$map <- renderLeaflet({
    leaflet() %>% 
      addTiles() %>% 
      setView(lng = 174.762224, lat = -36.846841, zoom = 12)
  })
  
  # load locations of buses whenever input slider changes
  d_bus_locations <- reactive({
    fname <- file_list()[input$time_slider]   # <- reactive input!
    readLines(file.path("data", fname)) %>% 
      get_bus_locations()
  })
  
  # update map whenever new bus locations become available
  observe({
    req(d_bus_locations())
    
    # join the route data to the dataframe of bus locations
    d <- d_bus_locations() #%>% 
      # left_join(d_bus_routes(), by = "route_id") %>% 
      # mutate(
      #   popup = sprintf("<strong>Line %s</strong> <em>(%s)</em><p>%s</p>", route_short_name, agency_id, route_long_name)
      # )
    
    # update the map
    # cat(paste("Making icons with",d$bearing,"\n"))
    busIcons <- make_icon_lst(d$bearing, BASE_ICON_URL)
    leafletProxy("map", data = d) %>% 
      clearMarkers() %>% 
      addMarkers(lng = ~longitude, lat = ~latitude, #popup = ~popup, 
                 icon = busIcons)
  })
  

  # Retrieval time ----------------------------------------------------------

  output$retrieval_time <- renderText({
    retr_time <- d_bus_locations()$retrieval_time[1]
    strftime(retr_time, format = "%d/%m/%Y %H:%M:%S")
  })
  

  # File list ---------------------------------------------------------------

  file_list <- reactive({
    list.files("./data/") %>% sort()
  })
  
  
  observe({
    updateSliderInput(session, "time_slider", max = length(file_list()))
  })
  
}

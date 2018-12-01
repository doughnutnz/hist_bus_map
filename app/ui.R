###########################################################
# UI definitions for the app
#
# Author: Doug Hunt
# Created: 2018-11-18
###########################################################


# Header ------------------------------------------------------------------

db_header <- dashboardHeader(
  title = "Historic Map of Bus Locations",
  tags$li(class = "dropdown", actionButton("intro", "Help", icon = icon("question-circle"), class = "btn-help")))


# Sidebar -----------------------------------------------------------------

db_sidebar <- dashboardSidebar(
  sidebarMenu(
    id = "tabs",
    menuItem("Bus Map", tabName = "bus_map", icon = icon("home")),
    menuItem("Help", tabName = "help", icon = icon("question")),
    .list = NULL
  ),
  collapsed = TRUE
)


# Body --------------------------------------------------------------------

db_body <- dashboardBody(
  # include shinyjs globally (must be included once only)
  useShinyjs(),
  introjsUI(),

  # add CSS customizations
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "assets/css/style.css")
  ),
  
  # make sidebar collapse when a menu item is clicked
  tags$script("$('.sidebar-menu a').click(function (e) {
              $('body').addClass('sidebar-collapse');
              $('body').removeClass('sidebar-open');
              });"),
  
  
  # add content for each menu item
  tabItems(
    ## Bus Map --------------

    tabItem(
      tabName = "bus_map",
      bus_mapModuleUI("bus_map_module")
    ),

    ## Help --------------

    tabItem(
      tabName = "help",
      helpModuleUI("help_module")
    ),

    tabItem("dummy")
  )
)


# Dashboard ---------------------------------------------------------------

ui <- dashboardPage(
  db_header,
  db_sidebar,
  db_body,
  skin = "blue"
)

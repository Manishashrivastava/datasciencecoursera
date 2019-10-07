ui <- fluidPage(
    titlePanel("My_ShinyApp"),
    sidebarLayout(
        sidebarPanel(
            leafletOutput("map",height = 800)),
        
        # Show a plot of the generated distribution
        mainPanel(
            p(em("This app showsSolar Irradiance or GHI at about 100 laocations that are displayed as blue circles on the map" )),
            p(strong("To see the profile at the particular location,just click on the circle above the map and the profile will appear on the left")),
            br(),
            code("In the plot, there are 4 variables that are shown in the legend, the skyblue ribbon shows the minimun-maximum value"),
            br(),
            p(),
            
            plotOutput("Plot1", width = 1000, height = 700)
        )
    ))

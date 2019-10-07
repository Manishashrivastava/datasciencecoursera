server <- function(input, output) {
    data <- reactiveValues(clickedMarker=NULL)
    
    output$map <- renderLeaflet(
        leaflet() %>%
            addTiles %>%
            addCircleMarkers(lat = df$x, lng = df$y, layerId = df$id,fillOpacity = 90, weight = 0, opacity = 0)  
    )
    
    # observe the marker click info and print to console when it is changed.
    
    observeEvent(input$map_marker_click,{
        print("observed map_marker_click")
        data$clickedMarker <- input$map_marker_click
        print(data$clickedMarker)
        my_place=(data$clickedMarker$id)
        val = as.integer(my_place) 
    output$Plot1 <- renderPlot({
        require(ggplot2)
        Colors = c("Average"="Black", "P90"= "Red", "P50" = "Blue", "P10"= "Magenta")
        ggplot(data.frame(average[,val])) +
            geom_line(aes(seq(1,24), average[,val],color = "Average"), group = 1) +
            geom_line(aes(seq(1,24), p90[,val],color = "P90"), group = 1) +
            geom_line(aes(seq(1,24), p50[,val],color = "P50"), group = 1) +
            geom_line(aes(seq(1,24), p10[,val],color = "P10"), group = 1) +
            geom_ribbon(aes(x = seq(1:24), ymax = max[,val], ymin = min[,val]), alpha = 0.5, fill = "skyblue")+
            scale_x_continuous(expand = c(0, 0),limits = c(1,24)) + scale_y_continuous(expand = c(0, 0),limits = c(0,1100))+ xlab("Hours") + 
            ylab("Solar radiation W/sqm")+
            scale_color_manual(values = Colors) 
        
    })
})
}
# Run the application 
shinyApp(ui = ui, server = server)
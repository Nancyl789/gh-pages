library(shiny)

# Using a reactive function define a function calculate the simple math
shinyServer(function(input, output) {
        x<- reactive({as.numeric(input$a)+5})
        output$x1<-renderText({input$a})
        output$x2<-renderText({x()  })
        output$x3<-renderText({x()+10})                  
})
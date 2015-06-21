---
title       : DevDataProdApp
subtitle    : Slidify-Shiny-R
author      : Dahao Ling
job         : Data Analyst
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : solarized_light     # 
widgets     : [bootstrap,quize, shiny, interactive,slider]    
mode        : selfcontained # {standalone, draft}


---

## Introduction

The project is to embedde shinyApp in slidify or Rstudio presenter report. The application using a slider with 10 numbers and out 3 simple algorithm results. Is it works well you can just move the slider to change the digits and the results should change instantly.


---

## Interactive Shiny App

<!--html_preserve--><div class="container-fluid">
<div class="row">
<div class="col-sm-12">
<h1>Developing ShinyApp!</h1>
</div>
</div>
<div class="row">
<div class="col-sm-4">
<form class="well">
<div class="form-group shiny-input-container">
<label class="control-label" for="a">Numbers</label>
<input class="js-range-slider" id="a" data-min="1" data-max="10" data-from="10" data-step="1" data-grid="true" data-grid-num="9" data-grid-snap="false" data-prettify-separator="," data-keyboard="true" data-keyboard-step="11.1111111111111"/>
</div>
</form>
</div>
<div class="col-sm-8">
<p>OUTPUT</p>
<p>OUTPUTa</p>
<div id="x1" class="shiny-text-output"></div>
<p>OUTPUTa+5</p>
<div id="x2" class="shiny-text-output"></div>
<p>OUTPUTa+5+10</p>
<div id="x3" class="shiny-text-output"></div>
</div>
</div>
</div><!--/html_preserve-->


---

## ShinyApp ui.R and server.r code
  #ui.R:
library(shiny)
# Define UI for application that calculate a simple slider number
shinyUI(pageWithSidebar(headerPanel("Developing ShinyApp!"),
        # Sidebar with a slider input for the number of consideration
        sidebarPanel( sliderInput("a","Numbers",min = 1,max = 10,value = 10)),# Output 3 simple caculations    
        mainPanel(p('OUTPUT'), p('OUTPUTa'),textOutput('x1'),
                  p('OUTPUTa+5'), textOutput('x2'),
                  p('OUTPUTa+5+10'), textOutput('x3'))))
# SERVER.r
 library(shiny)
        # Using a reactive function define a function calculate the simple                         
        math
        shinyServer(function(input, output) {
         x<- reactive({as.numeric(input$a)+5})
         output$x1<-renderText({input$a})
         output$x2<-renderText({x()  })
         output$x3<-renderText({x()+10})                  
        })

---


## Discussion

The slider of the shiny app works perfectly on shiny app. It may need more time for me to figure out how to use slidify to embeded the motion R code.

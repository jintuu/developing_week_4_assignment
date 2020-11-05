library(shiny)
library(datasets)

jish_data_mpg <- mtcars
jish_data_mpg$am <- factor(jish_data_mpg$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
    
    jish_text_formula <- reactive({
        paste("mpg ~", input$variable)
    })
    
    jish_text_formulaPoint <- reactive({
        paste("mpg ~", "as.integer(", input$variable, ")")
    })
    
    jish_fittt <- reactive({
        lm(as.formula(jish_text_formulaPoint()), data=jish_data_mpg)
    })
    
    output$caption <- renderText({
        jish_text_formula()
    })
    
    output$mpgBoxPlot <- renderPlot({
        boxplot(as.formula(jish_text_formula()), 
                data = jish_data_mpg,
                outline = input$outliers)
    })
    
    output$jish_fittt <- renderPrint({
        summary(jish_fittt())
    })
    
    output$mpgPlot <- renderPlot({
        with(jish_data_mpg, {
            plot(as.formula(jish_text_formulaPoint()))
            abline(jish_fittt(), col=2)
        })
    })
    
})
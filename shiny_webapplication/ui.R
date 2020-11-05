library(shiny)

shinyUI(
    navbarPage("this is an application based on shinny",
               tabPanel("we are now gng to do analysis here",
                        fluidPage(
                            titlePanel("here, we are trying to find out the correlation btw the eleven different attributes and the mileage attribute!!!"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "Variable:",
                                                c("Number of cylinders" = "cyl",
                                                  "Displacement (cu.in.)" = "disp",
                                                  "Gross horsepower" = "hp",
                                                  "Rear axle ratio" = "drat",
                                                  "Weight (lb/1000)" = "wt",
                                                  "1/4 mile time" = "qsec",
                                                  "V/S" = "vs",
                                                  "Transmission" = "am",
                                                  "Number of forward gears" = "gear",
                                                  "Number of carburetors" = "carb"
                                                )),
                                    
                                    checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                                ),
                                
                                mainPanel(
                                    h3(textOutput("inscription")),
                                    
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                                tabPanel("Regression model", 
                                                         plotOutput("mpgPlot"),
                                                         verbatimTextOutput("fit")
                                                )
                                    )
                                )
                            )
                        )
               ),
               tabPanel("now we are gng to discuss about the data we are gng to work on",
                        
                        h3("we are doing all this for a peer-graded assignment in my program elective course!!!"),
                        helpText("the data set we are using is the mt cars data set whoch is the most famous inbuilt data set used allaround the world by many data scientists!!",
                                 "our main aim for doing this exercise is used to find out how the mileage is affected depending on if the vehicle is automativ or manual!!!!"),
                        h3("Important"),
                        p("A data frame with 32 observations on 11 variables."),
                        
                        a("https://class.coursera.org/regmods-008")
               ),
               tabPanel("More Data Detail",
                        h2("Motor Trend Car Road Tests"),
                        hr(),
                        h3("Description"),
                        helpText("we are doing all this for a peer-graded assignment in my program elective course!!!",
                                 "the data set we are using is the mt cars data set whoch is the most famous inbuilt data set used allaround the world by many data scientists!! ",
                                 "our main aim for doing this exercise is used to find out how the mileage is affected depending on if the vehicle is automativ or manual!!!! "),
                        h3("Format"),
                        p("A data frame with 32 observations on 11 variables."),
                        
                        p("  [, 1]   mpg         Miles/(US) gallon"),
                        p("  [, 2]	 cyl	 Number of cylinders"),
                        p("  [, 3]	 disp	 Displacement (cu.in.)"),
                        p("  [, 4]	 hp	 Gross horsepower"),
                        p("  [, 5]	 drat	 Rear axle ratio"),
                        p("  [, 6]	 wt	 Weight (lb/1000)"),
                        p("  [, 7]	 qsec	 1/4 mile time"),
                        p("  [, 8]	 vs	 V/S"),
                        p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                        p("  [,10]	 gear	 Number of forward gears"),
                        p("  [,11]	 carb	 Number of carburetors"),
                        
                        h3("Source"),
                        
                        p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.")
               ),
               tabPanel("Github Details",
                        a("https://github.com/jintuu/developing_week_4_assignment/tree/main/shiny_webapplication"),
                        hr(),
                        h4("very first time in my life, as part of a peer-graded assignewmnt i have used shinny app"),
                        h4("for future reference, I have uploaded this to my repo: Jishnu Channamsetti")
               )
    )
)
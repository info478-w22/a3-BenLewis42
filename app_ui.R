library(shiny)
library(leaflet)



ui <- 
  navbarPage("A3 Disease Modeling - Ben Lewis",
             tabPanel("Introduction",
                      p("This application simulates both a deterministic and 
                        an individual contact model in an attempt to represent 
                        the COVID-19 pandemic, as well as the potential impact of 
                        different government policies and mandates. It should be 
                        emphasized that although both of these simulations intend to simulate 
                        the pandemic and potential changes accurately, they are 
                        created with the privilege of hindsight and a limited number of 
                        input variables.")
                      ),
             tabPanel("Deterministic Model",
                      sidebarLayout(
                        sidebarPanel(
                          radioButtons("mask", "Mask Policy:",
                                       c("Optional Masking" = FALSE,
                                         "Mask Mandate" = TRUE))
                          
                        ),
                        
                        mainPanel(
                          plotOutput("det_plot")
                          
                        )
                      )),
             tabPanel("Stochastic Model",
                      sidebarLayout(
                        sidebarPanel(
                          radioButtons("quar", "Quarantine Policy:",
                                       c("No government assistance for quarantining" = FALSE,
                                         "Paid time off to quarantine" = TRUE))
                          
                        ),
                        
                        mainPanel(
                          plotOutput("sim_plot")
                          
                        )
                      )
                      ),
             tabPanel("Interpretation",
                      p("In my deterministic model, a change in mask mandate manifests in
                        a decrease in inf.prob, or the probability of infection of each possible 
                        transmission act. This correlates to the infectious population peaking 
                        much later, allowing health services more time to react, and a longer 
                        window to distibute preventative vaccines."),
                      
                      p("In my stochastic model, financial assistance for infected people increases the 
                        di.rate, or likelihood for infected people to exit the population, limiting
                        the spread of the virus. This leads to much earlier peaks in infected population,
                        and a largely contained virus after just 400 days."),
                      
                      p("Although this model is limited in it\'s scope, it demonstrates the massive changes 
                        in outcome brough about by relatively small changes in input variables, emphasizing the
                        importance of a prompt and strong response in future crises.")
                      )
)



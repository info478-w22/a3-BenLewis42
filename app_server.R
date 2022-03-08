library(EpiModel)





server <- function(input, output){
  
  mask <- reactive({
    input$mask
    
  })
  
  quar <- reactive({
    input$quar
    
    
  })
  
  
  
  
  output$det_plot <- renderPlot({
    
    if (mask() == FALSE) {
      det_inf_prob <- 0.5
    } else {
      det_inf_prob <- 0.4
      
    }
    
    det_interaction_rate <- 0.06
    
    param <- param.dcm(inf.prob = det_inf_prob,
                       act.rate = det_interaction_rate)
    
    init <- init.dcm(s.num = 300000000, i.num = 1)
    control <- control.dcm(type = "SI", nsteps = 1000)
    
    
    det_mod <- dcm(param, init, control)
    plot(det_mod)
    
    
  })
  
  
  
  
  output$sim_plot <- renderPlot({
    
    
    
    if (quar() == FALSE) {
      di_rate <- 1/400
    } else {
      di_rate <- 1/100
    }
    
    param <- param.icm(inf.prob = 0.5, act.rate = 0.06, rec.rate = 1/200,
                       a.rate = 1/200, ds.rate = 1/200, di.rate = di_rate,
                       dr.rate = 1/200)
    
    init <- init.icm(s.num = 900, i.num = 100, r.num = 0)
    control <- control.icm(type = "SIR", nsteps = 1000, nsims = 10)
    sim <- icm(param, init, control)
    
    plot(sim)
  
    
    
  
  
  })
  
  
  
  
  
  
}



teal.data <- teal.data::teal_data(
  teal.data::dataset("IRIS", iris, code = "IRIS <- iris")
)

teal.modules <- teal::modules(
  teal::module(
    "Example",
    server = function(id, datasets) {
      moduleServer(id, function(input, output, session) {
        output$hist <- renderPlot(hist(datasets$get_data("IRIS", filtered = TRUE)$Petal.Width))
      })
    },
    ui = function(id, ...) {
      ns <- NS(id)
      div(
        h2("Sepal.Length"),
        p("Dummy data"),
        plotOutput(ns("hist"))
      )
    }
  ),
  teal::module(
    "Another tab",
    server = function(id, datasets) {
      moduleServer(id, function(input, output, session) {
        output$hist2 <- renderPlot(hist(datasets$get_data("IRIS", filtered = TRUE)$Petal.Width))
      })
    },
    ui = function(id, ...) {
      ns <- NS(id)
      div(
        h2("Petal Width"),
        plotOutput(ns("hist2"))
      )
    }
  )
)

server <- function(input, output, session) {
  teal::srv_teal_with_splash(
    id = "teal-wrapper",
    data = teal.data,
    modules = teal.modules
  )
}


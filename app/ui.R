teal.data <- teal.data::teal_data(
  teal.data::dataset("IRIS", iris, code = "IRIS <- iris")
)

ui <- teal::ui_teal_with_splash(
  id = "teal-wrapper",
  data = teal.data,
  title = "Minimal teal",
  header = "Minimal teal example",
  footer = "I am a good footer"
)

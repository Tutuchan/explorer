library(shiny)

navbarPage(
  title = "Explorer",
  tabPanel(
    title = "Strings",
    fluidPage(
      fluidRow(
        h1("Stringr explorer"),
        h5("Find the stringr function you need without digging through the docs"),
        br(),
        column(
          width = 4,
          h4("I have a string, I would like to:"),
          selectizeInput(inputId = "strSelect", label = "", choices = list("Detect Matches" = "detect", "Subset Strings" = "subset")),
          h4("I need to:"),
          uiOutput("strAfterSelect")
        ),
        column(
          width = 8,
          h2("Usage"),
          verbatimTextOutput("strUsage", placeholder = TRUE),
          h2("Output"),
          verbatimTextOutput("strOutput", placeholder = TRUE)
        )
      )
    )
  )
)


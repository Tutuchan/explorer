library(shiny)
library(stringr)
library(magrittr)
source("misc.R")

server <- function(input, output, session) {

  output$strAfterSelect <- renderUI({
    req(input$strSelect)

    choices <- switch(
      input$strSelect,
      detect = list(
        "detect the presence of a pattern" = "str_detect",
        "find the indices of string matches" = "str_which",
        "count the number of matches" = "str_count",
        "locate the positions of matches" = "str_locate"
      ),
      subset = list(
        "extract substrings" = "str_sub",
        "return the strings with a pattern match" = "str_subset",
        "return the pattern match as a vector" = "str_extract",
        "return the pattern match as a matrix" = "str_match"
      )
    )

    selectizeInput("strAfterSelect", label = "", choices = choices)
  })

  outputs <- reactive({
    req(input$strAfterSelect)

    string <- c("the quick brown", "fox jumps", "over the", "lazy dog")
    pattern <- "the"

    base <- "string <- c(\"the quick brown\", \"fox jumps\", \"over the\", \"lazy dog\")"

    switch(
      input$strAfterSelect,
      "str_detect" = list(
        usage = paste(base, "\npattern <- \"the\"\n\nstr_detect(string, pattern)\n"),
        output = str_detect(
          string = string,
          pattern = pattern
        )
      ),
      "str_which" = list(
        usage = paste(base, "\npattern <- \"the\"\n\nstr_which(string, pattern)\n"),
        output = str_which(
          string = string,
          pattern = pattern
        )
      ),
      "str_count" = list(
        usage = paste(base, "\npattern <- \"the\"\n\nstr_count(string, pattern)\n"),
        output = str_count(
          string = string,
          pattern = pattern
        )
      ),
      "str_locate" = list(
        usage = paste(base, "\npattern <- \"the\"\n\nstr_locate(string, pattern)\n"),
        output = str_locate(
          string = string,
          pattern = pattern
        )
      ),
      "str_sub" = list(
        usage = paste(base, "\npattern <- \"the\"\n\nstr_sub(string, start = 1, end = 4)\n"),
        output = str_sub(
          string = string,
          start = 1,
          end = 4
        )
      ),
      "str_subset" = list(
        usage = paste(base, "\npattern <- \"the\"\n\nstr_subset(string, pattern)\n"),
        output = str_subset(
          string = string,
          pattern = pattern
        )
      ),
      "str_extract" = list(
        usage = paste(base, "\npattern <- \"the\"\n\nstr_extract(string, pattern)\n"),
        output = str_extract(
          string = string,
          pattern = pattern
        )
      ),
      "str_match" = list(
        usage = paste(base, "\npattern <- \"the\"\n\nstr_match(string, pattern)\n"),
        output = str_match(
          string = string,
          pattern = pattern
        )
      )
    )
  })

  output$strUsage <- renderText({
    outputs()$usage
  })

  output$strOutput <- renderText({
    print_verbatim(outputs()$output)
  })

}

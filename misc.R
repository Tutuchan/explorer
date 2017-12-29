print_verbatim <- function(x) {
  x %>%
    capture.output() %>%
    paste(collapse = "\n")
}


% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calendar.R
\name{uicalendar}
\alias{uicalendar}
\alias{update_calendar}
\title{Create Semantic UI Calendar}
\usage{
uicalendar(
  name,
  value = NULL,
  placeholder = NULL,
  type = "date",
  min = NA,
  max = NA
)

update_calendar(session, id, value = NULL, min = NULL, max = NULL)
}
\arguments{
\item{name}{Input name. Reactive value is available under \code{input[[name]]}.}

\item{value}{The date to be set, default NULL}

\item{placeholder}{Text visible in the input when nothing is inputted.}

\item{type}{Select from \code{'year'}, \code{'month'}, \code{'date'} and \code{'time'}}

\item{min}{Minimum date that will be possible to set, default NULL}

\item{max}{Maximum date that will be possible to set, default NULL}

\item{session}{The \code{session} object passed to function given to
\code{shinyServer}.}

\item{id}{ID of the calendar that will be updated}
}
\description{
This creates a default calendar input using Semantic UI. The input is available
under \code{input[[name]]}.

This function updates the date on a calendar
}
\examples{
# Basic calendar
if (interactive()) {

  library(shiny)
  library(shiny.semantic)

  ui <- shinyUI(
    semanticPage(
      title = "Calendar example",
      uicalendar("date"),
      p("Selected date:"),
      textOutput("selected_date")
    )
  )

   server <- shinyServer(function(input, output, session) {
     output$selected_date <- renderText(
       as.character(input$date)
     )
   })

   shinyApp(ui = ui, server = server)
 }

\dontrun{
# Calendar with max and min
uicalendar(
  name = "date_finish",
  placeholder = "Select End Date",
  min = "2019-01-01",
  max = "2020-01-01"
)

# Selecting month
uicalendar(
  name = "month",
  type = "month"
)
}
}

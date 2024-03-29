% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/events_messageupdate.r
\name{events.message_update}
\alias{events.message_update}
\title{Event, emitted whenever a message is being updated}
\usage{
events.message_update(data, client)
}
\arguments{
\item{data}{The event fields}

\item{client}{The client object}
}
\description{
Event, emitted whenever a message is being updated
}
\examples{
\dontrun{
client$emitter$on("MESSAGE_UPDATE", channel, old_message, new_message, names(difference) {
 cat("Old content:", old_message$content, "New content:", new_message$content)
})
}
}

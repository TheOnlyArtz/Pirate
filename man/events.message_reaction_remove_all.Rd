% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/events_messagereactionremoveall.r
\name{events.message_reaction_remove_all}
\alias{events.message_reaction_remove_all}
\title{Event, emitted whenever a reaction is being detached from a message}
\usage{
events.message_reaction_remove_all(data, client)
}
\arguments{
\item{data}{The event fields}

\item{client}{The client object}
}
\description{
Event, emitted whenever a reaction is being detached from a message
}
\section{Disclaimer}{

reactions is a list of Reaction objects.
}

\examples{
\dontrun{
client$emitter$on("MESSAGE_REACTION_REMOVE_ALL", function(message, reactions) {
 cat("All of the reactions have been removed from", message$content)
})
}

}

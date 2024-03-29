% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/events_presenceupdate.r
\name{events.presence_update}
\alias{events.presence_update}
\title{Event, emitted whenever a user updates their presence}
\usage{
events.presence_update(data, client)
}
\arguments{
\item{client}{The client object}

\item{date}{The event fields}
}
\description{
Event, emitted whenever a user updates their presence
}
\section{Disclaimer}{

This event won't return the major argument (user in this case)
as I still need to figure out an efficient GLOBAL caching system.
}

\examples{
\dontrun{
client$emitter$on("PRESENCE_UPDATE", function(old_presence, new_presence, differences) {
 cat("New status:", new_presence$status, "Old status:", old_presence$status)
})
}
}

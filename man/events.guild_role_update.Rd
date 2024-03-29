% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/events_guildroleupdate.r
\name{events.guild_role_update}
\alias{events.guild_role_update}
\title{Event, emitted whenever a role gets an update}
\usage{
events.guild_role_update(data, client)
}
\arguments{
\item{data}{The event fields}

\item{client}{The client object}
}
\description{
Event, emitted whenever a role gets an update
}
\examples{
\dontrun{
client$emitter$on("GUILD_ROLE_UPDATE", guild, old_role, new_role, differences) {
 cat("New role name:", new_role$name, "it's old name: ", old_role$name)
})
}
}

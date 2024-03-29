% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/events_guildroledelete.r
\name{events.guild_role_delete}
\alias{events.guild_role_delete}
\title{Event, emitted whenever a role is being deleted}
\usage{
events.guild_role_delete(data, client)
}
\arguments{
\item{data}{The event fields}

\item{client}{The client object
\dontrun{
client$emitter$on("GUILD_ROLE_REMOVE", function(guild, role) {
 cat("The role:", role$name, "has been removed in:", guild$name, "!")
})
}}
}
\description{
Event, emitted whenever a role is being deleted
}
\section{Disclaimer}{

This event will return guild id instead of guild object if not cached.
this can be used in order to fetch the guild from the API (DISABLED FOR NOW)
}


% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/events_guildemojisupdate.r
\name{events.emojis_add}
\alias{events.emojis_add}
\title{Event, emitted whenever a new emoji is being added}
\usage{
events.emojis_add(emoji, client)
}
\arguments{
\item{emoji}{The new emoji object}

\item{client}{The client object}
}
\description{
Event, emitted whenever a new emoji is being added
}
\section{Note}{

this event is being emitted from events.guild_emojis_update
}

\examples{
\dontrun{
client$emitter$on("GUILD_EMOJIS_ADD", function(emoji) {
 guild = client$guilds$get(emoji$guild_id)
 cat("A new emoji with the name of", emoji$name, "has been added to", guild$name)
})
}
}

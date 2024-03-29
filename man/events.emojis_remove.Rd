% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/events_guildemojisupdate.r
\name{events.emojis_remove}
\alias{events.emojis_remove}
\title{Event, emitted whenever an emoji is being deleted}
\usage{
events.emojis_remove(emoji, client)
}
\arguments{
\item{emoji}{The deleted emoji}

\item{client}{The client object}
}
\description{
Event, emitted whenever an emoji is being deleted
}
\section{Note}{

this event is being emitted from events.guild_emojis_update
}

\examples{
\dontrun{
client$emitter$on("GUILD_EMOJIS_REMOVE", function(emoji) {
 guild = client$guilds$get(emoji$guild_id)
 cat("A new emoji with the name of", emoji$name, "has been removed to", guild$name)
})
}
}

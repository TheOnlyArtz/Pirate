% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/events_guildemojisupdate.r
\name{events.emojis_update}
\alias{events.emojis_update}
\title{Event, emitted whenever an emoji updates (for real)}
\usage{
events.emojis_update(new_emoji, old_emoji, differences, client)
}
\arguments{
\item{new_emoji}{The new emoji object}

\item{old_emoji}{The old emoji object}

\item{differences}{The differences between them}

\item{client}{The client object}
}
\description{
Event, emitted whenever an emoji updates (for real)
}
\section{Returns}{

This event like the other x_update events will return the (new object, old object, list of differences)
}

\section{Note}{

this event is being emitted from events.guild_emojis_update
}

\examples{
\dontrun{
client$emitter$on("GUILD_EMOJIS_UPDATE", function(new_emoji, old_emoji, differences) {
 cat(new_emoji$name, "has been updates from it's old name:", old_emoji$name)
 })
}
}

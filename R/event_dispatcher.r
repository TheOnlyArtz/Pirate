source("R/event_ready.r")
source("R/event_guildcreate.r")

dispatch <- function(data, client) {
  client$private$set("last_sequence", data$s)
  switch(data$t,
    "READY"={
      ready(data$d, client)
    },
    "GUILD_CREATE"={
      guildcreate(data$d, client)
    },
    {
      # TODO resume
    }
  )
}

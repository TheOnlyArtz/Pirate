source("R/event_ready.r")
source("R/event_guildcreate.r")

dispatch <- function(data, client) {
  client$lastSequence = data$s
  switch(data$t,
    "READY"={
      ready(data$d, client)
    },
    "GUILD_CREATE"={
      start_time <- Sys.time()
      guildcreate(data$d, client)
      end_time <- Sys.time()
      print(end_time - start_time)
    },
    {
    }
  )
}

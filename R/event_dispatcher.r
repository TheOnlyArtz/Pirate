source("R/event_ready.r")
source("R/event_guildcreate.r")
source("R/event_guildupdate.r")
source("R/event_guildremove.r")
source("R/event_guildbanadd.r")
source("R/event_guildbanremove.r")

dispatch <- function(data, client) {
  client$private$set("last_sequence", data$s)
  switch(data$t,
    "READY"={
      ready(data$d, client)
    },
    "GUILD_CREATE"={
      guildcreate(data$d, client)
    },
    "GUILD_UPDATE"={
      guildupdate(data$d, client)
    },
    "GUILD_REMOVE"={
      guildremove(data$d, client)
    },
    "GUILD_BAN_ADD"={
      guildbanadd(data$d, client)
    },
    "GUILD_BAN_REMOVE"={
      guildbanremove(data$d, client)
    },
    {
    }
  )
}

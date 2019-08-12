source("R/events_ready.r")
source("R/events_guildcreate.r")
source("R/events_guildupdate.r")
source("R/events_guildremove.r")
source("R/events_guildbanadd.r")
source("R/events_guildbanremove.r")
source("R/events_guildemojisupdate.r")

dispatch <- function(data, client) {
  client$private$set("last_sequence", data$s)
  switch(data$t,
    "READY"={
      events.ready(data$d, client)
    },
    "GUILD_CREATE"={
      events.guild_create(data$d, client)
    },
    "GUILD_UPDATE"={
      events.guild_update(data$d, client)
    },
    "GUILD_REMOVE"={
      events.guild_remove(data$d, client)
    },
    "GUILD_BAN_ADD"={
      events.guild_ban_add(data$d, client)
    },
    "GUILD_BAN_REMOVE"={
      events.guild_ban_remove(data$d, client)
    },
    "GUILD_EMOJIS_UPDATE"={
      event.guild_emojis_update(data$d, client)
    },
    {
    }
  )
}

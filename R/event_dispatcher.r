source("R/events_ready.r")
source("R/events_guildcreate.r")
source("R/events_guildupdate.r")
source("R/events_guildremove.r")
source("R/events_guildbanadd.r")
source("R/events_guildbanremove.r")
source("R/events_guildemojisupdate.r")
source("R/events_guildintegrationsupdate.r")
source("R/events_guildmemberadd.r")
source("R/events_guildmemberremove.r")
source("R/events_guildmemberupdate.r")
source("R/events_guildmemberschunk.r")

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
      events.guild_emojis_update(data$d, client)
    },
    "GUILD_INTEGRATIONS_UPDATE"={
      events.guild_integrations_update(data$d, client)
    },
    "GUILD_MEMBER_ADD"={
      events.guild_member_add(data$d, client)
    },
    "GUILD_MEMBER_REMOVE"={
      events.guild_member_remove(data$d, client)
    },
    "GUILD_MEMBER_UPDATE"={
      events.guild_member_update(data$d, client)
    },
    "GUILD_MEMBERS_CHUNK"={
      events.guild_members_chunk(data$d, client)
    },
    {
    }
  )
}

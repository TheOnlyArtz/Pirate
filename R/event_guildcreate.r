source("R/model_guild.r")

guildcreate <- function(data, client) {
  new <- isFALSE(client$guilds$has(data$id))
  guild <- Guild(data)
  client$guilds$set(data$id, guild)

  if (new)
    client$emitter$emit("GUILD_CREATE", guild)
}

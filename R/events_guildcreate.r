source("R/model_guild.r")

#' Event, emitted whenever the bot joins a guild
#' @param data The new guild object
#' @param client The client object
events.guild_create <- function(data, client) {
  new <- isFALSE(client$guilds$has(data$id))
  guild <- Guild(data, client)
  client$guilds$set(data$id, guild)

  if (new)
    client$emitter$emit("GUILD_CREATE", guild)
}

source("R/model_guild.r")

guildupdate <- function(data, client) {
  guild <- client$guilds$get(data$id)

  if (is.null(guild)) return() # Don't keep on going if not cached

  difference <- data[!(data %in% guild)]
  diff_guild <- Guild(difference)

  for (key in names(difference)) {
    guild[[key]] <- diff_guild[[key]]
  }

  client$guilds$set(data$id, guild)
  client$emitter$emit("GUILD_UPDATE", guild)
}

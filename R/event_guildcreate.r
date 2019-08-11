source("R/model_guild.r")

guildcreate <- function(data, client) {
  client$guilds$set(data$id, Guild(data))
}

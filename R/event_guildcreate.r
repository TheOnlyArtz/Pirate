source("R/model_guild.r")
guildcreate <- function(data, client) {
  client$add_guild(data$id, Guild$new(data))
  print(client$guilds[[data$id]]$name)
}

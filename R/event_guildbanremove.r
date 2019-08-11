source("R/model_user.r")

#' Event, emitted whenever a user ban is being revoked
#' @param data The event fields
#' @param client The client object
#' @examples
#' \dontrun{
#'  client$emitter$on("GUILD_BAN_REMOVE", function(guild, user) {
#'  cat(user$name, "'s' ban has been revoked on", guild$name)
#'})
#'}
#' @section Disclaimer:
#' Be aware that whenever the guild won't be cached
#' the guild parameter will return as a guild id
#' guild id can be used to fetch the guild from the API
guildbanremove <- function(data, client) {
  guild <- client$guilds$get(data$guild_id)

  if (is.null(guild)) guild <- data$guild_id
  
  # assuming user will never be cached
  # since BAN_ADD will remove them from the cache
  user <- User(data$user)

  client$emitter$emit("GUILD_BAN_REMOVE", guild, user)
}

source("R/model_user.r")

#' Event, emitted whenever a user gets hammered by the power of thor.
#' @slot data The event fields
#' @slot client The client object
#' @examples
#' \dontrun{
#' client$emitter$on("GUILD_BAN_ADD", function(guild, user) {
#'  cat("The user", user$username, "has been banned from", guild$name)
#'})
#'}
guildbanadd <- function(data, client) {
  guild <- client$guilds$get(data$guild_id)

  if (is.null(guild)) return()

  user <- client$users$get(data$user$id)

  if (is.null(user)) user <- User(data$user)
  client$emitter$emit("GUILD_BAN_ADD", guild, user)
}

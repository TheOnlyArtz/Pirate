#' Event, emitted whenever a role is being created
#' @param data The event fields
#' @param client The client object
#'\dontrun{
#' client$emitter$on("GUILD_ROLE_CREATE", function(guild, role) {
#'  cat("A new role:", role$name, "has been created in:", guild$name, "!")
#' })
#'}
#' @section Disclaimer:
#' This event will return guild id instead of guild object if not cached.
#' this can be used in order to fetch the guild from the API (DISABLED FOR NOW)
events.guild_role_create <- function(data, client) {
  guild <- client$guilds$get(data$guild_id)

  if (is.null(guild)) return()

  role <- Role(data$role, guild)
  guild$roles$set(role$id, role)

  client$emitter$emit("GUILD_ROLE_CREATE", guild, role)
}

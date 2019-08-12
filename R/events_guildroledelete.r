#' Event, emitted whenever a role is being deleted
#' @param data The event fields
#' @param client The client object
#'\dontrun{
#' client$emitter$on("GUILD_ROLE_REMOVE", function(guild, role) {
#'  cat("The role:", role$name, "has been removed in:", guild$name, "!")
#' })
#'}
#' @section Disclaimer:
#' This event will return guild id instead of guild object if not cached.
#' this can be used in order to fetch the guild from the API (DISABLED FOR NOW)
events.guild_role_delete <- function(data, client) {
  guild <- client$guilds$get(data$guild_id)

  if (is.null(guild)) return()

  # Theoretically role should never be null
  role <- guild$roles$get(data$role_id)
  guild$roles$remove(data$role_id)

  client$emitter$emit("GUILD_ROLE_DELETE", guild, role)
}

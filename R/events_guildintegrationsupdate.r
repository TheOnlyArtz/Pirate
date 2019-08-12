#' Event, emitted whenever a guild's integrations is being updated
#' @param data The event fields
#' @param client The client object
#' @examples
#' \dontrun{
#' client$emitter$on("GUILD_INTEGRATIONS_UPDATE", function(guild) {
#'  cat(guild$name, "Just updated their integrations")
#' })
#'}
#' @section Disclaimer:
#' This event will return guild id instead of guild object if not cached.
#' this can be used in order to fetch the guild from the API
events.guild_integrations_update <- function(data, client) {
  guild <- client$guilds$get(data$guild_id)

  if (is.null(guild)) guild <- guild_id

  client$emitter$emit("GUILD_INTEGRATIONS_UPDATE", guild)
}

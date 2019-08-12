source("R/model_role.r")

#' Event, emitted whenever a role gets an update
#' @param data The event fields
#' @param client The client object
#' @examples
#' \dontrun{
#'client$emitter$on("GUILD_ROLE_UPDATE", guild, old_role, new_role, differences) {
#'  cat("New role name:", new_role$name, "it's old name: ", old_role$name)
#'})
#'}
events.guild_role_update <- function(data, client) {
  guild <- client$guilds$get(data$guild_id)

  if (is.null(guild)) return()

  old_role <- guild$roles$get(data$role$id)

  difference <- data$role[!(data$role %in% role)]
  diff_role <- Role(difference)
  new_role <- old_role

  for (key in names(difference)) {
    new_role[[key]] <- diff_role[[key]]
  }

  client$roles$set(role$id, guild, old_role, new_role, name(difference))
}

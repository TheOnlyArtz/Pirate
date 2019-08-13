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

  difference <- data$role[!(data$role %in% old_role)]
  diff_role <- Role(difference, guild)
  new_role <- old_role

  for (key in names(difference)) {
    new_role[[key]] <- diff_role[[key]]
  }

  guild$roles$set(data$role$id, new_role)

  client$emitter$emit("GUILD_ROLE_UPDATE", guild, old_role, new_role, names(difference))
}

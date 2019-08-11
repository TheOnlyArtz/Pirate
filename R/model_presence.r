#' A Class which represents a presence object
#' @export
#'
#' @slot user the user presence is being updated for
#' @slot roles roles this user is in
#' @slot game null, or the user's current activity
#' @slot guild_id id of the guild
#' @slot status either "idle", "dnd", "online", or "offline"
#' @slot activities user's current activities
#' @slot client_status user's platform-dependent status
#'
Presence <- function(data) {
  value <- list(
    user = data$user, # TODO fetch out of cache
    roles = data$roles,
    game = data$game,
    guild_id = data$guild_id,
    status = data$status,
    activities = data$activities,
    client_status = data$client_status
  )

  attr(value, "class") <- "Presence"
  value
}

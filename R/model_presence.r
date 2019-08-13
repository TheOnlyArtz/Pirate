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
Presence <- function(data, guild_id = NULL) {
  value <- list(
    user = data$user, # TODO fetch out of cache
    roles = list(),
    game = data$game,
    guild_id = NA,
    status = data$status,
    activities = data$activities,
    client_status = data$client_status
  )

  value$guild_id <- if (!is.null(data$guild_id)) data$guild_id else guild_id
  value$roles <- if (!is.null(data$roles)) data$roles else list()

  attr(value, "class") <- "Presence"
  value
}

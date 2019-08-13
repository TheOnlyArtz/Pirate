#' A Class which represents a reaction model
#' @export
#'
#' @slot user_id
#' @slot channel_id
#' @slot message_id
#' @slot guild_id
#' @slot emoji
#' @slot custom whether this is a custom emoji
Reaction <- function(data, client) {
  value = list(
    user_id = data$user_id,
    channel_id = data$channel_id,
    message_id = data$message_id,
    guild_id = data$guild_id,
    emoji = data$emoji,
    custom = NA
  )

  guild <- client$guilds$get(data$guild_id)
  guild_exists <- isFALSE(is.null(guild))
  value$custom <- isFALSE(is.null(data$emoji$id))

  if (value$custom & guild_exists) {
    value$emoji <- guild$emojis$get(data$emoji$id)
  }

  attr(value, "class") <- "Reaction"
  value
}

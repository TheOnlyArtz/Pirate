#' A Class which represents a guild member
#' @export
#'
#' @slot user the user this guild member represents
#' @slot nick this users guild nickname (if one is set)
#' @slot roles array of role object ids
#' @slot joined_at when the user joined the guild
#' @slot premium_since when the user used their Nitro boost on the server
#' @slot deaf whether the user is deafened in voice channels
#' @slot mute whether the user is muted in voice channels
GuildMember <- function(data, client) {
  value <- list(
    nick = data$nick,
    roles = data$roles,
    joined_at = data$joined_at,
    premium_since = data$premium_since,
    deaf = data$deaf,
    mute = data$mute
  )

  value$user <- client$users$get(data$user$id)
  if (is.null(value$user)) value$user <- User(data$user)

  attr(value, "class") <- "GuildMember"
  value
}

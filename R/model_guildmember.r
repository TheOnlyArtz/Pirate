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
GuildMember <- R6Class("Class",
  public = list (
    initialize = function(data, client) {
      # self$user = client$users[[data$user$id]] <- if !is.null(client$users[[data$user$id]]) else User$new(data$user)

      self$nick = data$nick
      self$roles = data$roles # TODO
      self$joined_at = data$joined_at
      self$premium_since = data$premium_since
      self$deaf = data$deaf
      self$mute = data$mute

      if (is.null(client$users[[data$user$id]])) {
        self$user = User$new(data$user)
      } else {
        self$user = client$users[[data$user$id]]
      }
    },
    user = NA,
    nick = NA,
    roles = NA,
    joined_at = NA,
    premium_since = NA,
    deaf = NA,
    mute = NA
  )
)

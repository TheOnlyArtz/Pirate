#' A Class which represents a user object
#' @export
#'
#' @slot id The ID of the user
#' @slot username The username of the user
#' @slot discriminator The discriminator of the user (#XXXX)
#' @slot avatar The user's avatar hash
#' @slot flags The flags on a user's account
#' @slot premium_type The type of Nitro subscription on a user's account
User <- R6Class("Class",
  public=list(
    initialize = function(data) {
      self$id = data$id
      self$username = data$username
      self$discriminator = data$discriminator
      self$avatar = data$discriminator
      self$flags = data$flags
      self$premium_type = data$premium_type
    },
    id = NA,
    username = NA,
    discriminator = NA,
    avatar = NA,
    flags = NA,
    premium_type = NA
  ),
  lock_objects = FALSE
)

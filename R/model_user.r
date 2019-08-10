#' A Class which represents a user object
#' @export
#'
#' @section id The ID of the user
#' @section username The username of the user
#' @section discriminator The discriminator of the user (#XXXX)
#' @section avatar The user's avatar hash
#' @section flags The flags on a user's account
#' @section premium_type The type of Nitro subscription on a user's account
User <- R6Class("Class",
  public=list(
    initialize = function(data) {
      id = data$id
      username = data$username
      discriminator = data$discriminator
      avatar = data$discriminator
      flags = data$flags
      premium_type = data$premium_type
    },
    id = NA,
    username = NA,
    discriminator = NA,
    avatar = NA,
    flags = NA,
    premium_type = NA
  )
)

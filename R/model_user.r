#' A Class which represents a user object
#' @export
#'
#' @slot id The ID of the user
#' @slot username The username of the user
#' @slot discriminator The discriminator of the user (#XXXX)
#' @slot avatar The user's avatar hash
#' @slot flags The flags on a user's account
#' @slot premium_type The type of Nitro subscription on a user's account
User <- function(data) {
  value <- list(
    id = data$id,
    username = data$username,
    discriminator = data$discriminator,
    avatar = data$discriminator,
    flags = data$flags,
    premium_type = data$premium_type
  )

  attr(value, "class") <- "User"
  value
}

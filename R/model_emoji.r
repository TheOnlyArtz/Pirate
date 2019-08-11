#' A Class which represents a guild emoji object
#' @export
#'
#' @slot id emoji id
#' @slot name emoji name
#' @slot roles roles this emoji is whitelisted to
#' @slot user user that created this emoji
#' @slot require_colons whether this emoji must be wrapped in colons
#' @slot managed whether this emoji is managed
#' @slot animated whether this emoji is animated
Emoji <- function(data, guild) {
  value <- list(
    id = data$id,
    name = data$name,
    roles = fastmap(),
    users = data$users,
    require_colons = data$require_colons,
    managed = data$managed,
    animated = data$animated
  )

  if (length(data$roles) >= 1) {
    lapply(data$roles, function(id) value$roles$set(id, guild$roles$get(id)))
  }

  attr(value, "class") <- "Emoji"
  value
}

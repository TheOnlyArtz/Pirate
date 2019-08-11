#' A Class which represents a role object (exists in guilds only)
#' @export
#'
#' @slot id role id
#' @slot name role name
#' @slot color integer representation of hexadecimal color code
#' @slot hoist if this role is pinned in the user listing
#' @slot position position of this role
#' @slot permissions permissions bit set
#' @slot managed whether this role is managed by an integration
#' @slot mentionable whether this role is mentionable
Role <- function(data) {
  value <- list(
    id = data$id,
    name = data$name,
    color = data$color,
    hoist = data$hoist,
    position = data$position,
    managed = data$managed,
    mentionable = data$mentionable,
    permissions = data$permissions
  )

  attr(value, "class") <- "Role"
  value
}

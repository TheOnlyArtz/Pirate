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
Role <- R6Class("Class",
  public = list(
    initialize = function(data, client) {
      self$id = data$id
      self$name = data$name
      self$color = data$color
      self$hoist = data$hoist
      self$position = data$position
      self$managed = data$managed
      self$mentionable = data$mentionable
      self$permissions = data$permissions
    },
    id = NA,
    name = NA,
    color = NA,
    hoist = NA,
    position = NA,
    permissions = NA,
    managed = NA,
    mentionable = NA
  )
)

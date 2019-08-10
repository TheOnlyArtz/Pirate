library(R6)
source("R/gateway.r")

#' A Class which represents the Client
#' @export
#' @slot token The Client's token
#' @slot ws The WebSocket connection of the client
#' @slot user The client's user object
#' @slot heartbeat The heartbeat interval of the client
#' @slot lastSequence The last sequence ID/Number from Discord
#' @slot guilds The cached guilds of the Client
#' @slot users The cached users of the Client
#' @slot presences The cached presences of the Client
#' @section Warning:
#' Do not mutate heartbeat value
Client <- R6Class("Class",
  public = list(
    initialize = function(token) {
      self$token = token
    },
    token = NA,
    ws = NA,
    user = NA,
    heartbeat = NA,
    lastSequence = NA,
    guilds = list(),
    users = list(),
    presences = list(),
    add_guild = function (id, g) {
      self$guilds[[id]] <- g
    }
  ),
  lock_objects = FALSE
)

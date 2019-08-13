source("R/libraries.r")
source("R/gateway.r")
source("R/events_emitter.r")

#' A Class which represents the Client
#' @export
#' @slot token The Client's token
#' @slot ws The WebSocket connection of the client
#' @slot user The client's user object
#' @slot private set of fields you should not touch!
#' @slot guilds The cached guilds of the Client
#' @slot direct_channels The cached DMs of the Client
#' @slot users The cached users of the Client
#' @slot presences The cached presences of the Client
#' @slot emitter The event emitter
#' @section Warning:
#' Do not mutate heartbeat value
Client <- function(t) {
  value = list(
    token = t,
    ws = NA,
    user = NA,
    private = fastmap(),
    guilds = fastmap(),
    channels = fastmap(),
    direct_channels = fastmap(),
    users = fastmap(),
    presences = fastmap(),
    emitter = NA
  )

  value$private$set("heartbeat", NA)
  value$private$set("last_sequence", NA)
  value$private$set("session_id", NA)

  attr(value, "class") <- "Client"
  value
}

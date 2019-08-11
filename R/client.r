source("R/gateway.r")
source("R/events_emitter.r")

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
Client <- function(t) {
  value = list(
    token = t,
    ws = NA,
    user = NA,
    heartbeat = NA,
    lastSequence = NA,
    guilds = fastmap(),
    users = fastmap(),
    presences = fastmap(),
    emitter = NA
  )

  attr(value, "class") <- "Client"
  value
}

library(R6)
source("R/gateway.r")

#' A Class which represents the Client
#' @export
#' @slot token The Client's token
#' @slot ws The WebSocket connection of the client
#' @slot user #TODO
#' @slot heartbeat The heartbeat interval of the client
#' @slot lastSequence The last sequence ID/Number from Discord
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
    lastSequence = NA
  )
)

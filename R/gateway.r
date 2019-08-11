library(websocket)
library(rjson)

source("R/event_identify.r")
source("R/event_handler.r")

#' Connect and authenticate to the websocket via a client
#' @export
#'
#' @param client A Client class/object
#' @example
#' connect(client)
connect <- function(client) {
  start_connection(client)
}

start_connection <- function(client, reconnect = FALSE, resume = FALSE) {
  client$ws = WebSocket$new(
   "wss://gateway.discord.gg/?v=6&encoding=json",
   autoConnect = FALSE
  )

  client$ws$onOpen(function(event) {
    identify(client)
  })

  client$ws$onClose(function(event) {
    cat("Client disconnected with code ", event$code,
      " and reason ", event$reason, "\n", sep = "")
  })

  client$ws$onMessage(function(event) {
    data = fromJSON(event$data)
    handle(data$op, data, client)
  })

  client$ws$connect()

  while (TRUE) {
    later::run_now(1L)
  }
}

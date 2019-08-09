library(websocket)
library(rjson)

source("gateway/eventHandler.r")

connect <- function(client) {
  client$ws = WebSocket$new(
   "wss://gateway.discord.gg/?v=6&encoding=json",
   autoConnect = FALSE
  )

  client$ws$onOpen(onOpen)

  client$ws$onMessage(onMessage)

  client$ws$connect()

  while (TRUE) {
    later::run_now(1L)
  }
}

onOpen <- function(event) {
  cat("Opened a new connection against Discord\n")
}

onMessage <- function(event) {
  data = as.data.frame(event$data)
  handle(data$op, data)
}

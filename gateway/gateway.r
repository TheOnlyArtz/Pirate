library(websocket)
library(rjson)

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
  print(fromJSON(event$data))
}

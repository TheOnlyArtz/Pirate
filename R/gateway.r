source("R/request_identify.r")
source("R/request_resume.r")
source("R/event_handler.r")

#' Connect and authenticate to the websocket via a client
#' @export
#'
#' @param client A Client class/object
#' @examples
#' \dontrun{
#' client <- Client("<PRECIOUS TOKEN>")
#' connect(client)
#'}
connect <- function(client) {
  start_connection(client)
}

start_connection <- function(client, should_resume = FALSE) {
  client$ws = WebSocket$new(
   "wss://gateway.discord.gg/?v=6&encoding=json",
   autoConnect = FALSE
  )

  client$ws$onOpen(function(event) {
    if (isTRUE(should_resume))
      resume(client)
    else
      identify(client)
  })

  client$ws$onClose(function(event) {
    only_reconnect = event$code == 4000 | event$code == 4007 | event$code == 4009
    if (only_reconnect) {
      start_connection(client)
    } else {
      cat("Resume")
      start_connection(client, TRUE)
    }
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

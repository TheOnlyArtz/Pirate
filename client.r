library(websocket)
library(R6)
# ws <- WebSocket$new("ws://echo.websocket.org/", autoConnect = FALSE)
# ws$onOpen(function(event) {
#   cat("Connection opened\n")
#   ws$send("hello")
# })
# ws$onMessage(function(event) {
#   cat("Client got msg: ", event$data, "\n")
# })
# ws$onClose(function(event) {
#   cat("Client disconnected with code ", event$code,
#     " and reason ", event$reason, "\n", sep = "")
# })
# ws$onError(function(event) {
#   cat("Client failed to connect: ", event$message, "\n")
# })
# ws$connect()
#
#
# while (TRUE) {
#   later::run_now(1L)
# }

Client <- R6Class("Class",
  public = list(
    initialize = function(token) {
      self$token = token
      cat(token)
    },
    token = NA,
    ws = NA,
    user = NA
  )
)

client <- Client$new("Test")

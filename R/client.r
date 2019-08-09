library(R6)
source("R/gateway/gateway.r")

Client <- R6Class("Class",
  public = list(
    initialize = function(token) {
      self$token = token
    },
    token = NA,
    ws = NA,
    user = NA,
    heartbeat = NA
  )
)

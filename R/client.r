library(R6)
source("R/gateway.r")

#' @export
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

library(R6)
source("gateway/gateway.r")

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

connect(client)

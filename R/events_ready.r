source("R/model_user.r")

#' Event, emitted whenever the client finished the identifying phase
#' @param data Chunks of data relevant to the client
#' @param client The client object
events.ready <- function(data, client) {
  client$private$get("session_id", data$session_id)
  client$user <- User(data$user)
  client$emitter$emit("READY", client)
}

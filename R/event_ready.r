source("R/model_user.r")
ready <- function(data, client) {
  client$private$get("session_id", data$session_id)
  client$user <- User(data$user)
  client$emitter$emit("READY", client)
}

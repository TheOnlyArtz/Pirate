source("R/model_user.r")
ready <- function(data, client) {
  client$user <- User(data$user)
  client$emitter$emit("READY", client)
}

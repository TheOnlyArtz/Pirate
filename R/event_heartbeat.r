# OP: 1
heartbeat <- function (delay, client) {
  # Delay and recursion.
  data = list(
    op=1, # Hearbeat
    d=NA
  )
  client$ws$send(toJSON(data))

  if (isTRUE(client$private$get("reconnecting"))) {
    client$private$set("reconnecting", FALSE)
  } else {
    later::later(function () {
      heartbeat(delay, client)
    }, delay / 1000) # Spawn on a separate thread SIKE R is single threaded
  }
}

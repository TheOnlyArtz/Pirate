# OP: 1
heartbeat <- function (delay, client) {
  # Delay and recursion.
  data = list(
    op=1, # Hearbeat
    d=NA
  )
  client$ws$send(toJSON(data))

  later::later(function () {
    heartbeat(delay, client)
  }, delay / 1000) # Spawn on a separate thread
}

library(rjson)

# OP: 1
heartbeat <- function (delay, client) {
  if (client$curr_hb_time > client$last_hb_ack) {
    print(client$curr_hb_time)
    print(client$last_hb_ack)
  }
  # Delay and recursion.
  data = list(
    op=1, # Hearbeat
    d=NA
  )
  client$ws$send(toJSON(data))

  client$curr_hb_time = as.numeric(Sys.time())

  later::later(function () {
    heartbeat(delay, client)
  }, delay / 1000) # Spawn on a separate thread
}

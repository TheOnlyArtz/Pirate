source("R/event_identify.r")
source("R/event_dispatcher.r")
source("R/event_heartbeatack.r")
handle <- function(op, data, client) {
  switch(toString(op),
    "10"={identify(data, client)},
    "11"={heartbeat_ack(client)},
    "0"={dispatch(data, client)},
    {
      print(op)
    } #identify
  )
}

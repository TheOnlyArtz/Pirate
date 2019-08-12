source("R/event_dispatcher.r")
source("R/event_heartbeat.r")

handle <- function(op, data, client) {
  switch(toString(op),
    "9"={
      client$ws$close()
      start_connection(client)
    },
    "10"={heartbeat(data$d$heartbeat_interval, client)},
    "0"={dispatch(data, client)},
    {print(op)} #identify
  )
}

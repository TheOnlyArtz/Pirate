source("R/event_ready.r")

dispatch <- function(data, client) {
  client$lastSequence = data$s
  switch(data$t,
    "READY"={ready(data$d, client)}
  )
}

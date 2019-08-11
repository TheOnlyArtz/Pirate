heartbeat_ack <- function(client) {
  client$last_hb_ack <<- as.numeric(Sys.time())
  0
}

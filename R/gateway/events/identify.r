library(rjson)

source("gateway/events/heartbeat.r")

# OP 10
identify <- function(data, client) {
  identifyData = list(
    op=2,
    d = list(
      token=client$token,
      properties = list(
        "$os"=Sys.info()["sysname"], # Maybe add the build later on
        "$browser"="Pirate v0.0.1 (Git repository: https://github.com/theonlyartz/pirate)",
        "$device"="OnePlus 7 PRO :)"
      )
    )
  )

  client$heartbeat = data$d$heartbeat_interval
  client$ws$send(toJSON(identifyData))
  heartbeat(client$heartbeat, client)
}

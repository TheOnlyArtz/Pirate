source("R/event_heartbeat.r")

# OP 10
identify <- function(client) {
  identifyData = list(
    op=2,
    d = list(
      token = client$token,
      properties = list(
        "$os" = Sys.info()["sysname"], # Maybe add the build later on
        "$browser" = "Pirate v0.0.1 (Git repository: https://github.com/theonlyartz/pirate)",
        "$device" = "OnePlus 7 PRO :)"
      ),
      compress = FALSE,
      large_threshold = 250,
      shard = c(0,1),
      afk = FALSE,
      status = "online",
      since = Sys.time()
    )
  )

  client$ws$send(toJSON(identifyData))
}

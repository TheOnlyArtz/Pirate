# OP 10
identify <- function(client) {
  identiyData = data.frame(
    token=client$token,
    properties = data.frame(
      "$os"=Sys.info()["sysname"], # Maybe add the build later on
      "$browser"="Pirate v0.0.1 (Git repository: https://github.com/theonlyartz/pirate)",
      "$device"="OnePlus 7 PRO :)"
    )
  )
}

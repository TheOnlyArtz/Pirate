#' Event, emitted whenever a channel gets an update
#' @param data The event fields
#' @param client The client object
#' @examples
#'/dontrun{
#' client$emitter$on("CHANNEL_UPDATE", function(old_channel, new_channel) {
#'  # Assuming the name changed
#'  cat("New name:", new_channel$name, "Old name:", old_channel$name)
#' })
#'}
#'
events.channel_update <- function(data, client) {
  guild_channel_types = c(0, 2, 4, 5, 6)
  old_channel <- NA
  new_channel <- NA
  difference <- NA

  if (data$type %in% guild_channel_types) {
    guild <- client$guilds$get(data$guild_id)
    if (is.null(guild)) return()

    # Theoretically should never be NULL
    old_channel <- guild$channels$get(data$id)
    difference <- data[!(data %in% old_channel) & data != guild$id]
    diff_channel <- Channel(difference)
    new_channel <- old_channel

    for (key in names(difference)) {
      new_channel[[key]] <- diff_channel[[key]]
    }

    guild$channels$set(data$id, new_channel) # update
  } else {
    # DM
    old_channel <- client$direct_channels$get(data$id)
    difference <- data[!(data %in% old_channel)]
    diff_channel <- Channel(difference)
    new_channel <- old_channel

    for (key in names(difference)) {
      new_channel[[key]] <- diff_channel[[key]]
    }

    client$direct_channels$set(data$id, new_channel)
  }

  client$emitter$emit("CHANNEL_UPDATE", old_channel, new_channel, difference)
}

source("R/model_channel.r")
#' Event, emitted whenever a channel is being deleted
#' @param data The event fields
#' @param client The client object
#' @examples
#'\dontrun{
#' client$emitter$on("CHANNEL_DELETE", function (channel) {
#'   cat(channel$name, "has been deleted, damnit!")
#' })
#'}
#'
events.channel_delete <- function(data, client) {
  guild_channel_types = c(0, 2, 4, 5, 6)

  if (data$type %in% guild_channel_types) {
    guild <- client$guilds$get(data$guild_id)

    if (is.null(guild)) return

    channel <- guild$channels$get(data$id)
    if (is.null(channel)) channel <- Channel(data)

    guild$channels$remove(data$id)
  } else {
    channel <- client$direct_messages$get(data$id)
    if (is.null(channel)) channel <- Channel(data)

    client$direct_channels$remove(data$id)
  }

  client$emitter$emit("CHANNEL_DELETE", channel)
}

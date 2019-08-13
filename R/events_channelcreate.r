source("R/model_channel.r")

#' Event, emitted whenever a channel is being created
#' @param data The event fields
#' @param client The client object
#' @examples
#'\dontrun{
#'client$emitter$on("CHANNEL_CREATE", function(channel) {
#'  guild_channel_types = c(0, 2, 4, 5, 6)
#'  if (channel$type %in% guild_channel_types) {
#'    guild <- client$guilds$get(channel$guild_id)
#'    cat("A new channel called:", channel$name, "has been created in:", guild$id)
#'  }
#'})
#'}
#' @section Disclaimer:
#' Since Pirate does NOT handle channel types for you
#' you will have to be aware of it when involving complex actions
events.channel_create <- function(data, client) {
  guild_channel_types = c(0, 2, 4, 5, 6)
  channel <- Channel(data)

  if (data$type %in% guild_channel_types) {
    guild <- client$guilds$get(channel$guild_id)
    if (is.null(guild)) return()

    guild$channels$set(channel$id, channel)
  }
  client$channels$set(channel$id, channel)
  client$emitter$emit("CHANNEL_CREATE", channel)
}

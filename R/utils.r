#' @private
find_channel <- function(client, guild_id, channel_id) {
  guild <- client$guilds$get(if (isFALSE(is.null(guild_id))) guild_id else "0")
  channel <- if (is.null(guild))
    client$direct_channels$get(channel_id) else
    guild$channels$get(channel_id)

  channel
}

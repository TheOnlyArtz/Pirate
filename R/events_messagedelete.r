#' Event, emitted whenever a message is being deleted
#' @param data The event fields
#' @param client The client object
#' @examples
#'\dontrun{
#'client$emitter$on("MESSAGE_DELETE", function(channel, message) {
#' cat("Content of the deleted message:", message$content)
#'})
#'}
events.message_delete <- function(data, client) {
  guild <- client$guilds$get(if (isFALSE(is.null(data$guild_id))) data$guild_id else "0")
  channel <- if (is.null(guild))
    client$direct_channels$get(data$channel_id) else
    guild$channels$get(data$channel_id)

  if (is.null(channel)) return()

  message <- channel$messages$get(data$id)

  if (is.null(message)) return() # Already "deleted"
  channel$messages$remove(data$id)

  client$emitter$emit("MESSAGE_DELETE", channel, message)
}

#' Event, emitted whenever a message is being deleted
#' @param data The event fields
#' @param client The client object
#' @examples
#'\dontrun{
#'client$emitter$on("MESSAGE_DELETE_BULK", function(channel, messages) {
#' cat(length(messages), "have been deleted")
#' cat("Content of the deleted message:", message$content)
#'})
#'}
events.message_delete_bulk <- function(data, client) {
  channel <- client$channels$get(data$channel_id)

  if (is.null(channel)) return()

  curr_message <- NA
  messages <- list()

  for (id in data$ids) {
    curr_message <- channel$messages$get(id)
    if (isFALSE(is.null(curr_message))) {
      messages[[id]] <- curr_message
    }
    channel$messages$remove(id)
  }

  client$emitter$emit("MESSAGE_BULK_DELETE", channel, messages)
}

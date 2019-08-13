source("R/model_message.r")
#' Event, emitted whenever a message is being updated
#' @param data The event fields
#' @param client The client object
#' @examples
#'\dontrun{
#'client$emitter$on("MESSAGE_UPDATE", channel, old_message, new_message, names(difference) {
#'  cat("Old content:", old_message$content, "New content:", new_message$content)
#'})
#'}
events.message_update <- function(data, client) {
  channel <- client$channels$get(data$channel_id)

  old_message <- channel$messages$get(data$id)
  if (is.null(old_message)) return()

  difference <- data[!(data %in% old_message)]
  diff_message <- Message(difference, client)
  new_message <- old_message

  for(key in names(difference)) {
    new_message[[key]] <- diff_message[[key]]
  }

  channel$messages$set(data$id, new_message)

  client$emitter$emit("MESSAGE_UPDATE", channel, old_message, new_message, names(difference))
}

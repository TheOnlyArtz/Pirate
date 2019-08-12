source("R/model_message.r")

#' Event, emitted whenever one sends a message
#' @param data The event fields
#' @param client The client object
#' @examples
#'\dontrun{
#'  ...
#'  cat()
#' })
#'}
events.message_create <- function(data, client) {
  message <- Message(data, client)

  if (is.null(message$channel)) return() # come on, shouldn't even happen

  message$channel$messages$set(message$id, message)
  if (message$channel$messages$size() == 100) {
    last_msg <- message$channel$messages$get(tail(message$channel$messages$keys(),1))
    message$channel$messages$remove(last_msg$id)
  }

  client$emitter$emit("MESSAGE_CREATE", message)
}

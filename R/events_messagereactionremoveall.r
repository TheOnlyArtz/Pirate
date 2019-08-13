source("R/model_reaction.r")

#' Event, emitted whenever a reaction is being detached from a message
#' @param data The event fields
#' @param client The client object
#' @examples
#'\dontrun{
#'client$emitter$on("MESSAGE_REACTION_REMOVE_ALL", function(message, reactions) {
#'  cat("All of the reactions have been removed from", message$content)
#'})
#'}
#'
#' @section Disclaimer:
#' reactions is a list of Reaction objects.
events.message_reaction_remove_all <- function(data, client) {
  channel <- client$channels$get(data$channel_id)
  message <- channel$messages$get(data$message_id)

  if (isTRUE(is.null(message))) return()

  reactions <- message$reactions

  lapply(reactions$keys(), function(key) message$reactions$remove(key))

  client$emitter$emit("MESSAGE_REACTION_ALL", message, reactions$as_list())
}

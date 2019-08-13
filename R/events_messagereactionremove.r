source("R/model_reaction.r")
source("R/utils.r")

#' Event, emitted whenever a reaction is being detached from a message
#' @param data The event fields
#' @param client The client object
#' @examples
#'\dontrun{
#'client$emitter$on("MESSAGE_REACTION_REMOVE", function(message, reaction) {
#'  cat(reaction$emoji$name, "has been removed from", message$content)
#'})
#'}
#'
events.message_reaction_remove <- function(data, client) {
  channel <- find_channel(client, data$guild_id, data$channel_id)
  message <- channel$messages$get(data$message_id)

  if (isTRUE(is.null(message))) return()

  id <- if(isFALSE(is.null(data$emoji$id)))
   paste(data$emoji$name,":",data$emoji$id, sep="") else
   data$emoji$name

  reaction <- message$reactions$get(id)
  message$reactions$remove(id)

  client$emitter$emit("MESSAGE_REACTION_REMOVE", message, reaction)
}

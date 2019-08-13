source("R/model_reaction.r")

#' Event, emitted whenever a reaction is being attached to a message
#' @param data The event fields
#' @param client The client object
#' @examples
#'\dontrun{
#'client$emitter$on("MESSAGE_REACTION_ADD", function(message, reaction) {
#'  cat(reaction$emoji$name, "has been added to", message$content)
#'})
#'}
#'
events.message_reaction_add <- function(data, client) {
  reaction <- Reaction(data, client)
  channel <- client$channels$get(data$channel_id)
  message <- channel$messages$get(data$message_id)

  if (isTRUE(is.null(message))) return()

  id <- if(isTRUE(reaction$custom))
   paste(reaction$emoji$name,":",reaction$emoji$id, sep="") else
   reaction$emoji$name

  message$reactions$set(id, reaction)

  client$emitter$emit("MESSAGE_REACTION_ADD", message, reaction)
}

source("R/model_user.r")

#' A Class which represents a message object
#' @export
#'
#' @slot id id of the message
#' @slot channel_id id of the channel the message was sent in
#' @slot guild_id id of the guild the message was sent in
#' @slot author the author of this message (not guaranteed to be a valid user, see below)
#' @slot member member properties for this message's author
#' @slot content contents of the message
#' @slot timestamp when this message was sent
#' @slot edited_timestamp when this message was edited (or null if never)
#' @slot tts whether this was a TTS message
#' @slot mention_everyone whether this message mentions everyone
#' @slot mentions users specifically mentioned in the message
#' @slot mention_roles roles specifically mentioned in this message
#' @slot attachments any attached files
#' @slot embeds any embedded content
#' @slot reactions reactions to the message
#' @slot nonce used for validating a message was sent
#' @slot pinned whether this message is pinned
#' @slot webhook_id if the message is generated by a webhook, this is the webhook's id
#' @slot type type of message
#' @slot activity sent with Rich Presence-related chat embeds
#' @slot application sent with Rich Presence-related chat embeds
#' @import fastmap
Message <- function(data, client) {
  value = list(
    id = data$id,
    channel_id = data$channel_id,
    channel = NA,
    guild_id = data$guild_id,
    author = NA,
    member = data$member,
    content = data$content,
    timestamp = data$timestamp,
    edited_timestamp = data$edited_timestamp,
    tts = data$tts,
    mention_everyone = data$mention_everyone,
    mentions = data$mentions,
    mention_roles = data$mention_roles,
    attachments = data$attachments,
    embeds = data$embeds,
    reactions = fastmap(),
    nonce = data$nonce,
    pinned = data$pinned,
    webhook_id = data$webhook_id,
    type = data$type,
    activity = data$activity,
    application = data$application
  )

  value$channel <- client$channels$get(data$channel_id)
  value$author <- if (!is.null(client$users$get(data$author$id))) client$users$get(data$author$id) else User(data$author)
  attr(value, "class") <- "Message"
  value
}

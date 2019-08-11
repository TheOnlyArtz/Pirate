#' A Class which represents a channel object
#' @export
#'
#' @slot id the id of this channel
#' @slot type the type of channel
#' @slot guild_id the id of the guild
#' @slot position sorting position of the channel
#' @slot permission_overwrites explicit permission overwrites for members and roles
#' @slot name the name of the channel (2-100 characters)
#' @slot topic the channel topic (0-1024 characters)
#' @slot nsfw whether the channel is nsfw
#' @slot last_message_id the id of the last message sent in this channel (may not point to an existing or valid message)
#' @slot bitrate the bitrate (in bits) of the voice channel
#' @slot user_limit the user limit of the voice channel
#' @slot rate_limit_per_user amount of seconds a user has to wait before sending another message
#' @slot recipients the recipients of the DM
#' @slot icon icon hash
#' @slot owner_id id of the DM creator
#' @slot application_id application id of the group DM creator if it is bot-created
#' @slot parent_id id of the parent category for a channel
#' @slot last_pin_timestamp when the last pinned message was pinned
#'
#' @section Disclaimer: Pirate's channel object won't be separated to types!
#' see https://discordapp.com/developers/docs/resources/channel#channel-object-channel-types
#' to be able differentiate.
#' also, because of that, many fields are subject of being NULL accordingly.
Channel <- function(data) {
  value <- list(
    id = data$id,
    type = data$type,
    guild_id = data$guild_id,
    position = data$position,
    permission_overwrites = data$permission_overwrites,
    name = data$name,
    topic = data$topic,
    nsfw = data$nsfw,
    last_message_id = data$last_message_id,
    bitrate = data$bitrate,
    user_limit = data$user_limit,
    rate_limit_per_user = data$rate_limit_per_user,
    recipients = data$recipients,
    icon = data$icon,
    owner_id = data$owner_id,
    application_id = data$application_id,
    parent_id = data$parent_id,
    last_pin_timestamp = data$last_pin_timestamp
  )

  attr(value, "class") <- "Channel"
  value
}

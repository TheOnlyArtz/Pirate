library(fastmap)

source("R/model_guildmember.r")
source("R/model_role.r")
source("R/model_emoji.r")

#' A Class which represents a guild object
#' @export
#'
#' @slot id guild id
#' @slot name guild name (2-100 characters)
#' @slot icon	icon hash
#' @slot splash splash hash
#' @slot owner whether or not the user is the owner of the guild
#' @slot owner_id id of owner
#' @slot permissions total permissions for the user in the guild (does not include channel overrides)
#' @slot region voice region id for the guild
#' @slot afk_channel_id	id of afk channel
#' @slot afk_timeout afk timeout in seconds
#' @slot embed_enabled is this guild embeddable (e.g. widget)
#' @slot embed_channel_id if not null, the channel id that the widget will generate an invite to
#' @slot verification_level verification level required for the guild
#' @slot default_message_notifications default message notifications level
#' @slot explicit_content_filter explicit content filter level
#' @slot roles roles in the guild
#' @slot emojis custom guild emojis
#' @slot features enabled guild features
#' @slot mfa_level required MFA level for the guild
#' @slot application_id application id of the guild creator if it is bot-created
#' @slot widget_enabled	whether or not the server widget is enabled
#' @slot widget_channel_id the channel id for the server widget
#' @slot system_channel_id the id of the channel to which system messages are sent
#' @slot joined_at when this guild was joined at
#' @slot large whether this is considered a large guild
#' @slot unavailable is this guild unavailable
#' @slot member_count total number of members in this guild
#' @slot voice_stated (without the guild_id key)
#' @slot members users in the guild
#' @slot channels channels in the guild
#' @slot presences presences of the users in the guild
#' @slot max_presences the maximum amount of presences for the guild (the default value, currently 5000, is in effect when null is returned)
#' @slot max_members the maximum amount of members for the guild
#' @slot vanity_url_code the vanity url code for the guild
#' @slot description the description for the guild
#' @slot banner banner hash
#' @slot premium_tier premium_tier (SEE: https://discordapp.com/developers/docs/resources/guild#guild-object-premium-tier)
#' @slot premium_subscription_count the total number of users currently boosting this server
Guild <- function(data) {
  value <- list(
    id = data$id,
    name = data$name,
    icon = data$icon,
    splash = data$splash,
    owner = data$owner,
    owner_id = data$owner_id,
    permissions = data$permissions,
    region = data$region,
    afk_channel_id = data$afk_channel_id,
    afk_timeout = data$afk_timeout,
    embed_enabled = data$embed_enabled,
    embed_channel_id = data$embed_channel_id,
    verification_level = data$verification_level,
    default_message_notifications = data$default_message_notifications,
    explicit_content_filter = data$explicit_content_filter,
    emojis = fastmap(),
    features = data$features,
    mfa_level = data$mfa_level,
    application_id = data$application_id,
    widget_enabled = data$widget_enabled,
    system_channel_id = data$system_channel_id,
    jonied_at = data$jonied_at,
    large = data$large,
    unavailable = data$unavailable,
    member_count = data$member_count,
    voice_states = data$voice_states,
    members = fastmap(),
    roles = fastmap(),
    channels = data$channels,
    presences = data$presences,
    max_presences = data$max_presences,
    max_members = data$max_members,
    vanity_url_code = data$vanity_url_code,
    description = data$description,
    banner = data$banner,
    premium_tier = data$premium_tier,
    premium_subscription_count = data$premium_subscription_count
  )

  lapply(data$members, function(mem) value$members$set(mem$user$id, GuildMember(mem)))
  lapply(data$roles, function(role) value$roles$set(role$id, Role(role)))
  lapply(data$emojis, function(emoji) value$emojis$set(emoji$id, Emoji(emoji)))

  attr(value, "class") <- "Guild"
  value
}

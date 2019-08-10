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
Guild <- R6Class("Class",
  public = list(
    initialize = function(data) {
      self$id = data$id
      self$name = data$name
      self$icon = data$icon
      self$splash = data$splash
      self$owner = data$owner
      self$owner_id = data$owner_id
      self$permissions = data$permissions
      self$region = data$region
      self$afk_channel_id = data$afk_channel_id
      self$afk_timeout = data$afk_timeout
      self$embed_enabled = data$embed_enabled
      self$embed_channel_id = data$embed_channel_id
      self$verification_level = data$verification_level
      self$default_message_notifications = data$default_message_notifications
      self$explicit_content_filter = data$explicit_content_filter
      self$roles = data$roles
      self$emojis = data$emojis
      self$features = data$features
      self$mfa_level = data$mfa_level
      self$application_id = data$application_id
      self$widget_enabled = data$widget_enabled
      self$widget_channel_id = data$widget_channel_id
      self$system_channel_id = data$system_channel_id
      self$jonied_at = data$jonied_at
      self$large = data$large
      self$unavailable = data$unavailable
      self$member_count = data$member_count
      self$voice_states = data$voice_states
      self$members = data$members
      self$channels = data$channels
      self$presences = data$presences
      self$max_presences = data$max_presences
      self$max_members = data$max_members
      self$vanity_url_code = data$vanity_url_code
      self$description = data$description
      self$banner = data$banner
      self$premium_tier = data$premium_tier
      self$premium_subscription_count = data$premium_subscription_count
    },
    id = NA,
    name = NA,
    icon = NA,
    splash = NA,
    owner = NA,
    owner_id = NA,
    permissions = NA,
    region = NA,
    afk_channel_id = NA,
    afk_timeout = NA,
    embed_enabled = NA,
    embed_channel_id = NA,
    verification_level = NA,
    default_message_notifications = NA,
    explicit_content_filter = NA,
    roles = NA,
    emojis = NA,
    features = NA,
    mfa_level = NA,
    application_id = NA,
    widget_enabled = NA,
    widget_channel_id = NA,
    system_channel_id = NA,
    joined_at = NA,
    large = NA,
    unavailable = NA,
    member_count = NA,
    voice_states = NA,
    members = list(),
    channels = list(),
    presences = list(),
    max_presences = NA,
    max_members = NA,
    vanity_url_code = NA,
    description = NA,
    banner = NA,
    premium_tier = NA,
    premium_subscription_count = NA
  ),
  lock_objects = FALSE
)

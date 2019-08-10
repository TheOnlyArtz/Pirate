#' A Class which represents a guild object
#' @export
#'
#' @slot id
#' @slot name
#' @slot icon
#' @slot splash
#' @slot owner
#' @slot owner_id
#' @slot permissions
#' @slot region
#' @slot afk_channel_id
#' @slot afk_timeout
#' @slot embed_enabled
#' @slot embed_channel_id
#' @slot verification_level
#' @slot default_message_notifications
#' @slot explicit_content_filter
#' @slot roles
#' @slot emojis
#' @slot features
#' @slot mfa_level
#' @slot application_id
#' @slot widget_enabled
#' @slot widget_channel_id
#' @slot system_channel_id
#' @slot joined_at
#' @slot large
#' @slot unavailable
#' @slot member_count
#' @slot voice_stated
#' @slot members
#' @slot channels
#' @slot presences
#' @slot max_presences
#' @slot max_members
#' @slot vanity_url_code
#' @slot description
#' @slot premium_tier
#' @slot premium_subscription_count

Guild <- R6Class("Class",
  public = list(
    initialize <- function(data) {

    }
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
    members = NA,
    channels = NA,
    presences = NA,
    max_presences = NA,
    max_members = NA,
    vanity_url_code = NA,
    description = NA,
    banner = NA,
    premium_tier = NA,
    premium_subscription_count = NA
  )

)

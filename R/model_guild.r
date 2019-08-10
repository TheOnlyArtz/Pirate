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
  )

)

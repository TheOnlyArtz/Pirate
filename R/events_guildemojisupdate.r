source("R/model_emoji.r")

#' Event, emitted whenever an Emoji is being updated
#' @param data The event fields
#' @param client The client object
#' @section Disclaimer:
#' The way this event works is:
#'  This event calls sub events, by default the gateway doesn't have the option
#'  of recognizing what's an emoji remove and an emoji update for example.
#'  so I decided to handle that for you, adding 3 events in total of emojis update events
#' (These events are not documented in the official docs!)
#' 'GUILD_EMOJIS_UPDATE'
#' 'GUILD_EMOJIS_ADD'
#' 'GUILD_EMOJIS_REMOVE'
events.guild_emojis_update <- function(data, client) {
  guild <- client$guilds$get(data$guild_id)

  if (is.null(guild)) return()

  deleted_emojis <- guild$emojis$as_list()

  # return()

  for (emoji in data$emojis) {
    cached_emoji <- guild$emojis$get(emoji$id)
    new_emoji = Emoji(emoji, guild)

    if (isFALSE(is.null(cached_emoji))) {
      difference <- new_emoji[!(new_emoji %in% cached_emoji)]
      deleted_emojis[[emoji$id]] <- NULL

      if (length(names(difference)) > 0) {
        # If the difference between emoji to emoji is more than1
        # It's an indicator of EMOJIS_UPDATE
        events.emojis_update(cached_emoji, new_emoji, names(difference))
      }
    } else {
      # When an emoji is not cached it's sure to be a new one
      events.emojis_add(new_emoji, client)
    }
  }

  lapply(deleted_emojis, function(emoji) events.emojis_remove(emoji, client))
}

#' Event, emitted whenever an emoji updates (for real)
#' @param new_emoji The new emoji object
#' @param old_emoji The old emoji object
#' @param differences The differences between them
#' @param client The client object
#' @examples
#' \dontrun{
#' client$emitter$on("GUILD_EMOJIS_UPDATE", function(new_emoji, old_emoji, differences) {
#'  cat(new_emoji$name, "has been updates from it's old name:", old_emoji$name)
#'  })
#' }
#' @section Returns:
#' This event like the other x_update events will return the (new object, old object, list of differences)
#' @section Note:
#' this event is being emitted from events.guild_emojis_update
events.emojis_update <- function(new_emoji, old_emoji, differences, client) {
  client$emitter$emit("GUILD_EMOJIS_UPDATE", new_emoji, old_emoji, differences)
}

#' Event, emitted whenever a new emoji is being added
#' @param emoji The new emoji object
#' @param client The client object
#' @examples
#' \dontrun{
#' client$emitter$on("GUILD_EMOJIS_ADD", function(emoji) {
#'  guild = client$guilds$get(emoji$guild_id)
#'  cat("A new emoji with the name of", emoji$name, "has been added to", guild$name)
#' })
#'}
#' @section Note:
#' this event is being emitted from events.guild_emojis_update
events.emojis_add <- function(emoji, client) {
  guild = client$guilds$get(emoji$guild_id)

  if (is.null(guild)) return()

  guild$emojis$set(emoji$id, emoji)

  client$emitter$emit("GUILD_EMOJIS_ADD", emoji)
}

#' Event, emitted whenever an emoji is being deleted
#' @param emoji The deleted emoji
#' @param client The client object
#' @examples
#' \dontrun{
#' client$emitter$on("GUILD_EMOJIS_REMOVE", function(emoji) {
#'  guild = client$guilds$get(emoji$guild_id)
#'  cat("A new emoji with the name of", emoji$name, "has been removed to", guild$name)
#' })
#'}
#' @section Note:
#' this event is being emitted from events.guild_emojis_update
events.emojis_remove <- function(emoji, client) {
  guild = client$guilds$get(emoji$guild_id)

  if (is.null(guild)) return()

  guild$emojis$remove(emoji$id)

  client$emitter$emit("GUILD_EMOJIS_REMOVE", emoji)
}

#' Event, emits whenever a user leaves a guild
#' @param data The event fields
#' @param client The client object
#' @examples
#' \dontrun{
#' client$emitter$on("GUILD_MEMBER_REMOVE", function(guild, member) {
#'  cat(member$user$username, "just left", guild$name)
#' })
#' }
#' @section Disclaimer:
#' This event will return guild id instead of guild object if not cached.
#' this can be used in order to fetch the guild from the API
events.guild_member_remove <- function(data, client) {
  guild <- client$guilds$get(data$guild_id)
  member <- guild$members$get(data$user$id)

  if (is.null(member)) member <- GuildMember(data)
  
  if (is.null(guild)) {
    guild <- data$guild_id
  } else {
    guild$members$set(member$user$id, member)
  }

  client$emitter$emit("GUILD_MEMBER_REMOVE", guild, member)
}

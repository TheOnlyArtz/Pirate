source("R/model_guildmember.r")

#' Event, emitted whenever a user joins a guild
#' @param data The event fields
#' @param client The client fields
#' @examples
#' \dontrun{
#' client$emitter$on("GUILD_MEMBER_ADD", function(guild, member) {
#'  cat(member$user$username, "just joined", guild$name)
#' })
#' }
#' @section Disclaimer:
#' This event will return guild id instead of guild object if not cached.
#' this can be used in order to fetch the guild from the API
events.guild_member_add <- function(data, client) {
  guild <- client$guilds$get(data$guild_id)
  member <- GuildMember(data, client)
  if (is.null(guild)) {
    guild <- data$guild_id
  } else {
    guild$members$set(member$user$id, member)
  }

  client$emitter$emit("GUILD_MEMBER_ADD", guild, member)
}

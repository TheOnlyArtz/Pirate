source("R/model_guildmember.r")

#' Event, emits whenever a member updates it's state
#' @param data The event fields
#' @param client The client object
#' @examples
#'\dontrun{
#' client$emitter$on("GUILD_MEMBER_UPDATE", function(guild, old_member, new_member) {
#'  cat("Old nick", old_member$nick, "New:", new_member$nick)
#' })
#'}
#' @section Disclaimer:
#' This event will return guild id instead of guild object if not cached.
#' this can be used in order to fetch the guild from the API
#' AND old_member will return as NA if not cached
events.guild_member_update <- function(data, client) {
  guild <- client$guilds$get(data$guild_id)
  member <- guild$members$get(data$user$id)
  old_member <- NA

  if (is.null(guild)) return()  # Don't keep on going if not cached

  if (isFALSE(is.null(member))) {
    old_member <- member
  }

  tmp <- GuildMember(data, client)
  member$nick <- tmp$nick
  member$roles <- tmp$roles

  client$emitter$emit("GUILD_MEMBER_UPDATE", guild, old_member, member)
}

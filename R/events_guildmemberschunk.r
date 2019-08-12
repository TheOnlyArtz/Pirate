source("R/model_guildmember.r")

#' Event, emitted whenever one sends a respond for GUILD_MEMBERS_CHUNK
#' @param data The event fields
#' @param client The client object
#' @examples
#'\dontrun{
#' #TODO
#'
#'
#'}
#' @section Disclaimer:
#' This event will return guild id instead of guild object if not cached.
#' this can be used in order to fetch the guild from the API
#' If the guild is not cached therefore the chunk won't be cached to
#' as a result, the chunk will be returned as an array of GuildMember objects :)
#' so you will be able to cache the chunk when you fetch a new guild!
#' IF the guild is cached and it should be, the guild will be a guild object and
#' the members will be an array of IDs representing the new members
events.guild_members_chunk <- function(data, client) {
  guild <- client$guilds$get(data$guild_id)

  if (is.null(guild)) {
    members <- lapply(data$members, function(member) GuildMember(member, client))
    client$emitter$emit("GUILD_MEMBERS_CHUNK", guild, members)
    return()
  }

  lapply(data$members,
     function(member) guild$members$set(member$id, GuildMember(member, client))
   )

   client$emitter$emit("GUILD_MEMBERS_CHUNK", guild, names(data$members))
}

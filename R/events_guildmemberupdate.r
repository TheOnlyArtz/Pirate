source("R/model_guildmember.r")

#' Event, emits whenever a member updates it's state
#' @param data The event fields
#' @param client The client object
#' @examples
#'
#'
#'
#'
#' @section Disclaimer:
#' This event will return guild id instead of guild object if not cached.
#' this can be used in order to fetch the guild from the API
events.guild_member_update <- function(data, client) {
  guild <- client$guilds$get(data$guild_id)
  member <- guild$members$get(data$user$id)

  # print(member)
  if (is.null(guild) | is.null(member)) return()  # Don't keep on going if not cached

  # print(data)
  diff_member = GuildMember(data, client)
  difference <- data[
      (!(data %in% diff_member) & (data == "roles" | data == "nick" | data == "user"))
    ]

  print(names(difference))
}

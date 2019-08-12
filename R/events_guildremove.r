#' whenever a guild becomes unavilable or the bot has been removed from there
#' @param data The guild object (partial)
#' @param client The client object
#' @examples
#' \dontrun{
#'  client$emitter$on("GUILD_REMOVE", function(guild) {
#'    cat("The bot left ", guild$name)
#'  })
#'}
events.guild_remove <- function(data, client) {
  guild <- client$guilds$get(data$id)

  if (isFALSE(is.null(guild)))
    client$guilds$remove(data$id)

  client$emitter$emit("GUILD_REMOVE", guild)
}

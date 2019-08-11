#' A Function which is being used to update the client's presence
#' @export
#'
#' @param client The client object
#' @param presence The presence object (named list)
#' @section Resource:
#'
#' See https://discordapp.com/developers/docs/topics/gateway#update-status
#'
#' @section Warning:
#' Sending malformed payload will result in errors! don't panick :)
#'
#' @examples
#' update.presence(client, list(game=list(name="Hey!", type=0)))
#' update.presence(client, list(game=list(name="Streaming!", type=1, url="https://twitch.tv/theonlyartz")))
update.presence <- function(client, presence) {
  payload <- list(
    op = 3,
    d = presence
  )

  if (is.null(presence$afk)) payload$d$afk <- FALSE
  if (is.null(presence$status)) payload$d$status <- "online"
  if (is.null(presence$since)) payload$d$since <- NA

  json <- toJSON(payload)
  cat(json)
  client$ws$send(json)
}

#' Event, emitted whenever one starts to type
#' @param data The event fields
#' @param client The client object
#' @examples
#'\dontrun{
#'client$emitter$on("TYPING_START", channel, user) {
#'  cat("User:", user$username, "started smashing his keyboard in:", channel$name)
#'})
#'}
events.typing_start <- function(data, client) {
  channel <- client$channels$get(data$channel_id)
  user <- client$users$get(data$user_id)

  if (is.null(user) | is.null(channel)) return()

  client$emitter$emit("TYPING_START", channel, user)
}

source("R/model_presence.r")

#' Event, emitted whenever a user updates their presence
#' @param date The event fields
#' @param client The client object
#' @examples
#'\dontrun{
#'client$emitter$on("PRESENCE_UPDATE", function(old_presence, new_presence, differences) {
#'  cat("New status:", new_presence$status, "Old status:", old_presence$status)
#'})
#'}
#' @section Disclaimer:
#' This event won't return the major argument (user in this case)
#' as I still need to figure out an efficient GLOBAL caching system.
events.presence_update <- function(data, client) {
  # TODO fetch the user...
  old_presence = client$presences$get(data$user$id)

  if (is.null(old_presence)) return()

  diff_presence = Presence(data)
  difference = diff_presence[!(diff_presence %in% old_presence)]
  new_presence = old_presence
  for (key in names(difference)) {
    new_presence[[key]] <- diff_presence[[key]]
  }

  client$presences$set(data$user$id, new_presence)
  client$emitter$emit("PRESENCE_UPDATE", old_presence, new_presence, names(difference))
}

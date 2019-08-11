#' A Class which emits event, heavily modelled after Node.js
#' @export
#'
#' @slot client The client to emmit the events to
#' @slot events The event handlers
#' @slot emit The function which is used to emit events
#' @slot on The function which will add handlers
EventEmitter <- function(c) {
  value <- list(
    client = c,
    events = fastmap()
  )

  value$emit <- function(event, ...) {
    for (cb in value$events$get(event)) {
      cb(...)
    }
  }

  value$on <- function(event, cb) {
    if (isFALSE(value$events$has(event)))
      value$events$set(event, c())

    vector_events = value$events$get(event)
    vector_events = vector_events <- c(vector_events, cb)
    value$events$set(event, vector_events)
  }

  attr(value, "class") <- "EventEmitter"
  value
}

library(crul)
library(rjson)
library(synchronicity)
library(anytime)
library(later)

#' A Class which manages the REST-ful side of Pirate
#' @export
#' @slot mutexes The mutexes responsible to hold the requests
#' @slot global_mutex The global mutex
#' @slot client The client object
#' @import crul
#' @import rjson
ApiManager <- function(c) {
  value = list(
    mutexes = list(),
    global_mutex = boost.mutex(),
    client = c,
    http_client = HttpClient$new(
      url = "https://discordapp.com/",
      headers = list(
        "Authorization" = paste("Bot", c$token, sep=" ")
      )
    )
  )

  attr(value, "class")
  value
}

mutex_wait <- function(mutex) {
  synchronicity::lock(mutex)
  synchronicity::unlock(mutex)
}

sync_wait <- function(time, mutex) {
  later::later(function () {
    mutex_wait(mutex)
  }, time / 1000)
}

api.request <- function(client, t) {
  api_manager <- client$api_manager
  mutex <- NA
  retry_after <- NA
  request_done <- FALSE

  req <- HttpRequest$new(
    url = "https://discordapp.com/api/v6/channels/610531328450101269/messages",
    headers = list(
      "Authorization" = paste("Bot", client$token, sep=" ")
    )
  )

  while(!request_done) {
    if (is.null(api_manager$mutexes[["guilds"]])) {
      api_manager$mutexes[["guilds"]] <- boost.mutex()
    }

    mutex <- api_manager$mutexes[["guilds"]]

    mutex_wait(mutex)
    mutex_wait(api_manager$global_mutex)

     req$post(body=list(content=toString(t)))
     response <- AsyncVaried$new(req)
     res <- response$request()[[1]]
     res_body <- fromJSON(response$parse("UTF-8"))

      if (isTRUE(res$status_code == 429) | isTRUE(res$response_headers[["x-ratelimit-remaining"]] == "0")) {
        # Rate limited!
        if (!is.null(res$response_headers[["retry-after"]])) {
          retry_after <- res$response_headers[["retry-after"]]
        } else {
          req_time <- as.numeric(as.POSIXct(anydate(res$response_headers[["date"]])))
          reset_time <- as.numeric(res$response_headers[["x-ratelimit-reset"]])
          retry_after <- reset_time - req_time
        }

      if (!is.null(res$response_headers[["x-ratelimit-global"]])) {
        # oof we are deep in trouble-zone
        sync_wait(as.numeric(retry_after), api_manager$global_mutex)
      } else {
        print(as.numeric(retry_after))
        sync_wait(as.numeric(retry_after), mutex)
      }
      request_done <- if (response$status_code() == 429) FALSE else TRUE
      } else {
        request_done = TRUE
      }
  }
  "JUST TESTING"
}
# Heavily Discordcr/rb inspired ♥

library(rjson)

resume <- function(client) {
  s_id = client$private$get("session_id")
  last_sequence = client$private$get("last_sequence")

  payload <- list(
    op = 6,
    d = list(
      token = client$token,
      session_id = s_id,
      seq = last_sequence
    )
  )

  client$ws$send(toJSON(payload))
}

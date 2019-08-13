options(digits = 22)
DISCORD_EPOCH <- 1420070400000
#' A function which resolves an ID to a timestamp in ms
#' @export
#' @param id The ID you want to resolve
resolve.snowflake <- function(id) {
  floor((as.numeric(id)/(2^22)) + DISCORD_EPOCH)
}

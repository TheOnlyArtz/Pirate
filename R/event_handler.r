source("R/pirate.r")

handle <- function(op, data, client) {
  switch(toString(op),
    "10"={identify(data, client)},
    {
      print(data)
    } #identify
  )
}

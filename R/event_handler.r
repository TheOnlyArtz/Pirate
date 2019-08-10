source("R/event_identify.r")
source("R/event_dispatcher.r")

handle <- function(op, data, client) {
  switch(toString(op),
    "10"={identify(data, client)},
    "0"={dispatch(data, client)},
    {
      print(op)
    } #identify
  )
}

source("gateway/events/index.r")

handle <- function(op, data, client) {

  switch(toString(op),
    "10"={identify(client)},
    {
      
    } #identify
  )
}

source("R/model_user.r")
ready <- function(data, client) {
  client$user = User$new(data$user)
  print(paste(client$user$username, toString(client$user$discriminator), sep=" "))
  print("Connected successfully!")
}

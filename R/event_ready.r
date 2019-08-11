source("R/model_user.r")
ready <- function(data, client) {
  client$user = User(data$user)
  print(paste(client$user$username, toString(client$user$discriminator), sep=" "))
  print("Connected successfully!")
}

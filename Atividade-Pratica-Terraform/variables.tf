variable "access_key" {
  description = "Meu valor de access_key"
  type = string 
  default = "A..."
}

variable "secret_key" {
  description = "Meu valor de secret_key"
  type = string 
  default = "9..."
}

variable "ec2-terraform" {
  type = list(string)
  default = ["webserver_ittallent_one", "webserver_ittalent_two"]
}
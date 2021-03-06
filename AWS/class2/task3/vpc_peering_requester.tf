

#provider "aws" {
 # region = "us-east-1"

  # Requester's credentials.
#}

provider "aws" {
  alias  = "peer"
  region = "us-east-2"

}

resource "aws_vpc" "peer" {
  provider   = "aws.peer"
  cidr_block = "192.168.0.0/16"
}

data "aws_caller_identity" "peer" {
  provider = "aws.peer"
}

# Requester's side of the connection.
resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = "vpc-067b2cdfceed292ae"
  peer_vpc_id   = "vpc-0b131881b6a3b3680"
  peer_owner_id = "052063109334"
  #peer_accepter_id = "052063109334 "
  peer_region   = "us-east-2"
  auto_accept   = false

  tags = {
    Side = "Requester"
  }
}
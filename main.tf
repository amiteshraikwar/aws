terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.49.0"

    }
  }
}
provider "aws" {
   region = "ca-central-1"
}

#provider information block END
#plan2 resource block  BEGIN
resource "aws_instance" "plan2" {
  instance_type          = "t2.small"
  ami                    = "ami-0eb0a4a8621e5203b"
  vpc_security_group_ids = ["sg-09ceefbf9a601fc5a"]
  subnet_id              = "subnet-006fb95481ef8f2f2"
  associate_public_ip_address = "true"
 # lifecycle {
 #  prevent_destroy = true
 #}
  disable_api_termination = "true"
  root_block_device {
  volume_type = "gp2"
  volume_size = "30"

  }
  user_data   = <<EOF
    <powershell>
    net user hercules 'Trianz@1234' /add /y
    net localgroup administrators hercules  /add
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
    $file = "$env:temp\ConfigureRemotingForAnsible.ps1"
    (New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
    powershell.exe -ExecutionPolicy ByPass -File $file
    Rename-Computer -NewName "plan2" -Restart
    </powershell>
  EOF
  tags                 = {
        Name =  "plan2"
      }
}
#plan2 resource block  END
#plan3 resource block  BEGIN
resource "aws_instance" "plan3" {
  instance_type          = "t2.small"
  ami                    = "ami-0eb0a4a8621e5203b"
  vpc_security_group_ids = ["sg-09ceefbf9a601fc5a"]
  subnet_id              = "subnet-006fb95481ef8f2f2"
  associate_public_ip_address = "true"
  disable_api_termination = "true"
  root_block_device {
  volume_type = "gp2"
  volume_size = "30"

  }
  user_data   = <<EOF
    <powershell>
    net user hercules 'Trianz@1234' /add /y
    net localgroup administrators hercules  /add
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
    $file = "$env:temp\ConfigureRemotingForAnsible.ps1"
    (New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
    powershell.exe -ExecutionPolicy ByPass -File $file
    Rename-Computer -NewName "testvm" -Restart
    </powershell>
  EOF
  tags                 = {
        Name =  "plan3"
      }
}
#plan3 resource block  END
#plan4 resource block  BEGIN
resource "aws_instance" "plan4" {
  instance_type          = "t2.small"
  ami                    = "ami-0eb0a4a8621e5203b"
  vpc_security_group_ids = ["sg-09ceefbf9a601fc5a"]
  subnet_id              = "subnet-006fb95481ef8f2f2"
  associate_public_ip_address = "true"
  disable_api_termination = "true"
  root_block_device {
  volume_type = "gp2"
  volume_size = "30"

  }
  tags                 = {
        Name =  "plan4"
      }
}
#plan4 resource block  END

#!/usr/bin/env bash
IP=`ip add | grep inet | awk 'NR ==3 {print $2}'`
echo 'Atualizando os Pacotes SRV:'$HOSTNAME' - IP:'$IP''
clear
KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDXvrIN4eT0/8JxGWOvnmvbnez3CJ0WwwJbQnmKXDD7yGEhp5PUU5jTN1qOBxwTZkYR+jka8/2ga69DmiB6iHfxvQnZ0DvApP2iyMCR+CYtgM3zsxtsSOoL1TaIQqMm/4Hjcnx6zxo/Dh6RhSiRftaGt+yohbNdiRONWEAQi/v5VcIYv3tM8ezXRfmU2SmzPdk0r/gI6iTHQF9f+sh7KW6Lm9V57oXt1ov1jF95QqsjOCOpkz/N+PQF3UQ+AR+gTQMeehWTIQQzXtD0g9KmLw+vAx7xd0GHo5drXXsrwDN5ka0iPMyl6Gd9gMTIB6lDo6hVPFXl+/2E+PlGGMmnkCkOJvWaR0Xj+dVmbku/Q8fDwd7mCOXz5fwz/rXL3yJAzSMDLwL0NcdJOi6o1sL5U1Z7JyyJVRdKUpKhpvHL5QtlZAoHqTctd6fWTDpi8xnVdH/l2wTXPDVYOp91cKY0vWYk7fuMg0gt1TrQ4Jlu2CETPRYr3TrkW8Gd5GKKzJv1oeU= root@vagrant"
clear
echo $KEY >> .ssh/authorized_keys
clear
sudo apt-get install python3 -y
clear

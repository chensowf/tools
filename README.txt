
���������Ϳͻ���Ҫͬʱ���е�ʱ����Ҫȥ��ʼ�˵�Ѱ��
"Add a new TAP virtual ethernet adapter"
��ִ��

�������������������2�������ֱ����Ϊ��gz��server



���������� frps.ini
[common]
bind_port = 8443
server_port = 3388
privilege_mode = true
privilege_token = txkkxt12
max_pool_count = 50

frps -c /etc/frps.ini


# systemd �����ļ�
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


��������֤���ļ��ο�
OpenVpn-server-build_CRT.txt

spiped.key �������ɷ���
dd if=/dev/urandom bs=32 count=1 of=spiped.key

frps.ini �� frpc.ini
ֻҪ��Կ�ͽ��ա�ת���˿���һ���ģ�����ϵͳʱ�䶼��������û���������

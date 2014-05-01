#!/bin/bash

WHITE_LIST="172.16.1.8 172.16.1.9 172.16.1.10"


# WHITE_LISTに登録されたIPアドレスからの接続を許可
# -m multiportと--dportsオプションを指定すると複数のポート番号をまとめて指定できるらしい
for ipaddr in $WHITE_LIST
do
iptables -A INPUT -m state --state NEW -m tcp -p tcp -s $ipaddr -m multiport --dports 0:65535 -j ACCEPT
done
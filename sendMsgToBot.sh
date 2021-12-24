#!/bin/bash

# $(...)            赋值
# install vim:      "apt-get update && apt-get install -y vim"
# curl -A           用户代理标头
# curl -s/--silent  静默模式
# curl -X/--request 指定什么命令 这里是 POST
# curl -d/--data	  方式传送数据 POST 的 body 参数
# cat               read local file content
# echo              >> is added, > is covered

IP_ADDRESS="$(curl -s ifconfig.me)"
LOCAL_IP_ADDRESS="$(cat ip.config)"

TOKEN="xxxx"
CHAT_ID="123xxxx"
MESSAGE="Hello World, Home's IP is ${IP_ADDRESS}"

URL="http://xx.xx.xx.xx:2456/sendMessage"

echo $LOCAL_IP_ADDRESS

if [ "${IP_ADDRESS}" == "${LOCAL_IP_ADDRESS}" ]; then
  echo "重复了"
else
  echo $MESSAGE
  curl \
    -s \
    -o /dev/null \
    -X POST \
    $URL \
    -d token="${TOKEN}" \
    -d chat_id="${CHAT_ID}" \
    -d text="${MESSAGE}"
  
  echo "${IP_ADDRESS}" > ip.config
fi

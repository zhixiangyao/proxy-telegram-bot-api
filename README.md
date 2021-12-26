# Proxy Telegram Bot API Service

## 描述

如果你有一台国内公网的软路由，想知道软路由的 ip，

想把 ip（或者其它消息） 发送给 telegram bot，但是这个网站又不能正常访问，

那么这个项目可以帮助你，代理转发到 telegram bot ～

## 前置环境

- Linux -> [NodeJS](https://nodejs.org/zh-cn/)               version >= 12
- Linux -> [NodeJS](https://nodejs.org/zh-cn/) -> [pm2](https://pm2.keymetrics.io/docs/usage/quick-start/)

## 安装

```bash
# method = post
# uri = 'http://localhost:2456/sendMessage'
# body.token = 'xxxx'
# body.text = 'Hello World'
# body.chat_id = '123465xxx'
```

- npm

  ```bash
  npm install
  npm run serve
  ```

- yarn

  ```bash
  yarn
  yarn serve
  ```

- pnpm
  ```bash
  pnpm install
  pnpm run serve
  ```

## 部署

```bash
npm install --global pm2
pm2 start ./proxy-telegram-bot/main.js --name proxy-xxxx
```

## Nginx 转发

- 弄个二级域名 bot.xxx.com

```bash
vim /etc/nginx/nginx.conf
```

```conf
# HTTP server
server {
    listen       80;
    server_name  bot.xxx.com;

    location / {
        proxy_pass http://127.0.0.1:2456;
        proxy_set_header Host $proxy_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

```bash
# centos 8
systemctl status nginx.service
```

## 执行脚本

[sendMsgToBot.sh](https://github.com/zhixiangyao/proxy-telegram-bot-api/blob/main/sendMsgToBot.sh)

```bash
# crontab  1 分钟执行一次
* * * * * /www/sendMsgToBot.sh
```

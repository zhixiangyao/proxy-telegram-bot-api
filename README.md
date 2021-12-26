# Proxy Telegram Bot API Service

## Description

如果你有一台国内公网的软路由，想知道软路由的 ip，

想把 ip（或者其它消息） 发送给 telegram bot，但是这个网站又不能正常访问，

那么这个项目可以帮助你，代理转发到 telegram bot ～

## Installation

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

## Deployment

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

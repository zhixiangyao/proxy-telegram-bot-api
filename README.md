# Proxy Telegram Bot API Service

## Description

如果你有一台国内公网的软路由，想知道软路由的 ip，

想把 ip（或者其它消息） 发送给 telegram bot，但是这个网站又不能正常访问，

并且你在国外有一台服务器，那么这个项目可以帮助你，代理转发到 telegram bot ～

## Installation

```sh
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

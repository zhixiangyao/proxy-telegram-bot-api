const express = require('express')
const bodyParser = require('body-parser')
const fetch = require('node-fetch')

async function postData(url = '', data = {}) {
  const response = await fetch(url, {
    method: 'POST',
    mode: 'cors',
    cache: 'no-cache',
    credentials: 'same-origin',
    headers: {
      'Content-Type': 'application/json',
    },
    redirect: 'follow',
    referrerPolicy: 'no-referrer',
    body: JSON.stringify(data),
  })
  return await response.json()
}

const app = express()
const PORT = 2456

app.use(bodyParser.urlencoded({ extended: true }))

app.post('/sendMessage', async (req, res) => {
  const BODY = {
    token: req.body.token ?? '',
    chat_id: req.body.chat_id ?? '',
    text: req.body.text ?? '',
  }
  const { token, chat_id, text } = BODY

  if (!token || !chat_id || !text) {
    res.status(400).send('参数有误！')
    return
  }

  try {
    const data = await postData(`https://api.telegram.org/bot${token}/sendMessage`, { chat_id, text })
    res.send(data)
  } catch (error) {
    res.status(400).send(error)
  }
})

app.listen(PORT, () => {
  console.log(`http://localhost:${PORT}`)
})

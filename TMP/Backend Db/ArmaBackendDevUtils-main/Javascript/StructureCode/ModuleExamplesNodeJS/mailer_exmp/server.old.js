// imports
const fastify = require('fastify')({ logger: true })
const path = require("path")
// const firstRoute = require('./routes')
const index_html = path.join(__dirname, "/index.html")

// init
process.setMaxListeners(0)

// fastify nodemailer setup
fastify.register(require('fastify-nodemailer'), {
  pool: true,
  host: 'smtp.example.com',
  port: 465,
  secure: true, // use TLS
  auth: {
    user: 'scorapp.deneme@gmail.com',
    pass: 'scappdeneme98',
  },
})

fastify.get("/", async (req, res) => {
  res.sendFile(index_html)
})

fastify.get('/sendmail/:email', (req, res, next) => {
  let { nodemailer } = fastify
  let recipient = req.params.email

  nodemailer.sendMail({
    from: "scorapp.deneme@gmail.com",
    to: "berkay.girgin2@gmail.com",
    subject: "Node JS mail deneme",
    text: "Oldu 💪"
  }, (err, info) => {
    if (err) next(err)
    res.send({
      messageId: info.messageId
    })
  })
  res.send({message: "message sent"})
})

// register routes
// fastify.register(firstRoute)
// fastify.register(require('./routes'))

// run server
fastify.listen(3000, (err, address) => {
  if (err) fastify.log.error(err)
  fastify.log.info(`server listening on ${fastify.server.address().port}`)
})

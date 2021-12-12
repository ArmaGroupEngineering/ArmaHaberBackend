// imports
const fastify = require('fastify')({ logger: true })
const path = require('path')
const bodyParser = require('body-parser')
const nodemailer = require('nodemailer')

// servestatic via fastify
fastify.register(require('fastify-static'), {
  root: path.join(__dirname, 'public'),
  prefix: '/public/', // optional: default
})

// ability to read handlebars files
fastify.register(require('point-of-view'), {
  engine: {
    handlebars: require('handlebars'),
  },
})

// content type
fastify.addContentTypeParser(
  'application/json',
  { parseAs: 'string' },
  (req, body, done) => {
    try {
      const json = JSON.parse(body)
      done(null, json)
    } catch (err) {
      err.statusCode = 400
      done(err, undefined)
    }
  }
)

fastify.use(function (err, req, res, next) {
  console.log('query: ', req.query)
  console.log('params: ', req.params)
  next()
})

fastify.register(require('middie'))
fastify.use(require('cors')())
fastify.use(require('helmet'))

// register routes
fastify.register(require('./routes'))

// init
process.setMaxListeners(0)

// run server
fastify.listen(3000, (err, address) => {
  if (err) fastify.log.error(err)
  fastify.log.info(`server listening on http://localhost:3000`)
})

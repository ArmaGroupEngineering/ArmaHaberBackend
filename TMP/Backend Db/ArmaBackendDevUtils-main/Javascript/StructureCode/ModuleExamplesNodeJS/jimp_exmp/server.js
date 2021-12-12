// imports
const fastify = require('fastify')({ logger: true })
// const firstRoute = require('./routes')

// init
process.setMaxListeners(0)

// register routes
// fastify.register(firstRoute)
fastify.register(require("./routes"))

// run server
fastify.listen(3000, (err, address) => {
  if (err) fastify.log.error(err)
  fastify.log.info(`server listening on ${fastify.server.address().port}`)
})

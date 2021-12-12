const fastify = require('fastify')({ logger: true });

fastify.register(require('fastify-jwt'), {
  secret: 'secret',
});

fastify
  .decorate('authenticate', async (req, res) => {
    try {
      await req.jwtVerify();
    } catch (err) {
      res.send(err);
    }
  })
  .after(() => {
    fastify.route({
      method: 'GET',
      url: '/secret',
      preHandler: [fastify.authenticate],
      handler: (req, res) => {
        res.send('secret');
      },
    });
  });

fastify.post('/signup', (req, res) => {
  const token = fastify.jwt.sign({
    foo: 'bar',
  });
  res.send({ token });
});

fastify.listen(3000, function (err, address) {
  if (err) {
    fastify.log.error(err);
    process.exit(1);
  }
  fastify.log.info(`server is running on port ${address}`);
});

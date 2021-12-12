module.exports = (app) => {
  const dbCommands = require('../controllers/app.controllers')

  let router = require('express').Router()

  // FIXME
  // Create an item
  router.post('/', dbCommands.create)

  // Retrieve all items
  router.get('/', dbCommands.findAll)

  // Retrieve a single item
  router.get('/:id', dbCommands.findOne)

  // Update an item with id
  router.put('/:id', dbCommands.update)

  // Delete and item with id
  router.delete('/:id', dbCommands.delete)

  // Delete all items
  router.delete('/', dbCommands.deleteAll)

  app.use('/api/v1', router)
}

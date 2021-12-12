const Item = require('../models/app.model')

// Create and Save a new item
exports.create = (req, res) => {
  // Validate request
  if (!req.body) {
    req.status(400).send({
      message: 'Content can not be empty!',
    })
  }
}

// Create an item
// just an example
const item = new Item({
  title: req.body.title,
  description: req.body.description,
  published: req.body.published || false,
})

// save the item in the database
Item.create(item, (err, data) => {
  if (err)
    res.status(500).send({
      message: err.message || 'Some error occured while creating the item',
    })
  else res.send(data)
})

// Retrieve all items from the database (with condition)
exports.findAll = (req, res) => {
  const title = req.query.title

  Item.getAll(title, (err, data) => {
    if (err)
      res.status(500).send({
        message: err.message || 'Some Error Occured while retrieving items',
      })
    else res.send(data)
  })
}

// Find a single item by id
exports.findOne = (req, res) => {
  Item.findById(req.params.id, (err, data) => {
    if (err) {
      if (err.kind === 'not_found') {
        res.status(404).send({
          message: `Not found Item with id ${req.params.id}`,
        })
      } else {
        res.status(500).send({
          message: 'Error retrieving Item with id ' + req.params.id,
        })
      }
    } else res.send(data)
  })
}

// find all published items
exports.findAllPublished = (req, res) => {
  Item.getAllPublished((err, data) => {
    if (err)
      res.status(500).send({
        message: err.message || 'Some Error occured while retrievin tutorials',
      })
  })
}

// Update an item identified by the id in the request
exports.update = (req, res) => {
  // validate the request
  if (!req.body)
    res.status(400).send({
      message: 'Content can not be empty!',
    })

  console.log(req.body)

  Item.updateById(req.params.id, new Item(req.body), (err, data) => {
    if (err) {
      if (err.kind === 'not_found') {
        res.status(404).send({
          message: `Not found item with id ${req.params.id}`,
        })
      } else {
        res.status(500).send({
          message: 'Error updating item with id ' + req.params.id,
        })
      }
    } else res.send(data)
  })
}

// Delete an Item with the specified id in the request
exports.delete = (req, res) => {
  Item.remove(req.params.id, (err, data) => {
    if (err) {
      if (err.kind === 'not_found') {
        res.status(404).send({
          message: 'Not found Item with id ' + req.params.id,
        })
      } else {
        res.status(500).send({
          message: 'Could not delete item with id ' + req.params.id,
        })
      }
    } else res.send({ message: 'Item deleted successfully!' })
  })
}

// delete all items from the database
exports.deleteAll = (req, res) => {
  Item.removeAll((err, data) => {
    if (err)
      res.status(500).send({
        message:
          err.message || 'Some Error Occured While Removing All Tutorials',
      })
    else res.send({ message: `All Tutorials deleted successfully!` })
  })
}

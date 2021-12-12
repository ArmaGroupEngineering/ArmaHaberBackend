const sql = require('./db')
const variables = require('../utils/db.config')

// constructor
const Item = function (item) {
  ;(this.title = item.title),
    (this.description = item.description),
    (this.published = item.published)
}

// create item
Item.create = (newItem, result) => {
  sql.query(`INSERT INTO ${variables.tableName} SET ?`, newItem, (err, res) => {
    if (err) {
      console.log('error: ', err)
      result(err, null)
      return
    }
    console.log('Created Item: ', { id: res.insertId, ...newItem })
    result(null, { id: res.insertId, ...newItem })
  })
}

// find by id
Item.findById = (id, result) => {
  sql.query(
    `SELECT * FROM ${variables.tableName} WHERE id = ${id}`,
    (err, res) => {
      if (err) {
        console.log('error: ', err)
        result(err, null)
        return
      }
      if (res.length) {
        console.log('Found Item: ', res[0])
        result(null, res[0])
        return
      }

      // not found tutorial with the id
      result({ kind: 'not_found' }, null)
    }
  )
}

// get all
Item.getAll = (title, result) => {
  let query = `SELECT * FROM ${variables.tableName}`

  if (title) {
    query += ` WHERE title LIKE '%${title}`
  }

  sql.query(query, (err, res) => {
    if (err) {
      console.log('error: ', err)
      result(null, err)
      return
    }
    console.log('Items', res)
    result(null, res)
  })
}

// get all published
Item.getAllPublished = (result) => {
  sql.query(
    `SELECT * FROM ${variables.tableName} WHERE published=true`,
    (err, res) => {
      if (err) {
        console.log('error: ', err)
        result(null, err)
        return
      }
    }
  )
}

// updatebyid
Item.updateById = (id, item, result) => {
  sql.query(
    `UPDATE items SET title = ?, description = ?, published = ? WHERE id = ?`,
    [item.title, item.description, item.published, id],
    (err, res) => {
      if (err) {
        console.log('error', err)
        result(null, err)
        return
      }
      if (res.affectRows == 0) {
        // not found item with the id
        result({ kind: 'not_found' }, null)
      }

      console.log('Updated item: ', { id: id, ...item })
      result(null, { id: id, ...item })
    }
  )
}

Item.remove = (id, result) => {
  sql.query(
    `DELETE FROM ${variables.tableName} WHERE id = ?`,
    id,
    (err, res) => {
      if (err) {
        console.log('error: ', err)
        result(null, err)
        return
      }
      if (res.affectRows == 0) {
        result({ kind: 'not_found' }, null)
        return
      }
      console.log('Deleted item with id: ', id)
      result(null, res)
    }
  )
}

Item.removeAll = (result) => {
  sql.query(`DELETE FROM ${variables.tableName}`, (err, res) => {
    if (err) {
      console.log('error: ', err)
      result(null, err)
      return
    }
    console.log(`Deleted ${res.affectRows} items`)
    result(null, res)
  })
}

module.exports = { Item }

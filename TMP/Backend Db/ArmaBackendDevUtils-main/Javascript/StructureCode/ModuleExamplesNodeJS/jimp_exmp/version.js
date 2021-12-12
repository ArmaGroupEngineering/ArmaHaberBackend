const options = {
  client: 'mysql2',
  connection: {
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'fromHTMLDENEME',
  },
}

const knex = require('knex')(options)
knex.raw('SELECT VERSION()').then((version) =>
  console
    .log(version[0][0])
    .catch((err) => {
      console.log(err)
      throw err
    })
    .finally(() => {
      knex.destroy()
    })
)

// knex create table
knex.schema
  .createTable('cars', (table) => {
    table.increments('id')
    table.string('name')
    table.integer('price')
  })
  .then(() => console.log('table created'))
  .catch((err) => {
    console.log(err)
    throw err
  })
  .finally(() => {
    knex.destroy()
  })

// inserting data
const cars = [
  { name: 'Audi', price: 300000 },
  { name: 'Mercedes', price: 234000 },
  { name: 'BMW', price: 872400 },
]
knex('cars')
  .insert(cars)
  .then(() => console.log('data inserted'))
  .catch((err) => {
    console.log(err)
    throw err
  })
  .finally(() => {
    knex.destroy()
  })

// selecting all rows
knex
  .from('cars')
  .select('*')
  .then((rows) => {
    for (row of rows) {
      console.log(`${row['id']} ${row['name']} ${row['price']}`)
    }
  })
  .catch((err) => {
    console.log(err)
    throw err
  })
  .finally(() => {
    knex.destroy()
  })

// restricing output with WHERE
knex
  .from('cars')
  .select('name', 'price')
  .where('price', '>', '500000')
  .then((rows) => {
    for (row of rows) {
      console.log(`${row['name']} ${row['price']}`)
    }
  })
  .catch((err) => {
    console.log(err)
    throw err
  })
  .finally(() => {
    knex.destroy()
  })

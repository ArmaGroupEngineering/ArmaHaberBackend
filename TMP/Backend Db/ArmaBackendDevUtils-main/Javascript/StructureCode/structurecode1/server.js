// *** imports
// -- LIBS
const express = require('express')
// const bodyParser = require("body-parser") // NOTE: deprecated..
const cors = require('cors')

// -- local
const dbConfig = require('./app/utils/db.config')
const appVars = require('./app/utils/app.config')

// ** init
const app = express()

// -- corsOptions /* NOTE */
const corsOptions = (corsPORT = {
  origin: `http://localhost:8081`,
})



app.use(cors(corsOptions))

// parse requests of content-type - application/json
app.use(express.json()) /* NOTE: bodyParser.json is deprecated */

// parse requests of content-type - application/x-www-form-urlencoded
app.use(
  express.urlencoded({ extended: true })
) /* NOTE: bodyParser.urlencoded() is deprecated  */

// route
app.get('/', (req, res) => {
  res.json({ message: 'welcome to my struct' })
})

require('./app/routes/app.routes')(app)

const PORT = process.env.PORT || appVars.PORT
app.listen(PORT, () =>
  console.log(`Server is running on http://localhost:${PORT}`)
)

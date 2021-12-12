async function routes(fastify, options) {
  fastify.get('/', async (req, res) => {
    res.view('/mailer_exmp/views/index.handlebars', { text: 'text' })
  })

  fastify.get('/sendMail', async (req, res) => {
    // res.send({ message: 'mail sent' })

    const output = `
    <p>You have a new contact request</p>
    <h3>Contact Details</h3>
    <ul>  
      <li>Name: ${req.body.name}</li>
      <li>Company: ${req.body.company}</li>
      <li>Email: ${req.body.email}</li>
      <li>Phone: ${req.body.phone}</li>
    </ul>
    <h3>Message</h3>
    <p>${req.body.message}</p>
  `

    // create bot account

    // create a reusable transporter
    let transporter = nodemailer.createTransport({
      host: 'smtp.gmail.com',
      port: 587,
      secure: false,
      auth: {
        user: 'scorapp.deneme@gmail.com',
        pass: 'scorappdeneme98',
      },
      tls: {
        rejectUnauthorized: false,
      },
    })

    // setup mail data with unicode symbol
    let mailOptions = {
      from: '"NodeMailContact" <scorapp.deneme@gmail.com>',
      to: 'berkay.girgin2@gmail.com',
      subject: 'Mail Sending Via Node js',
      text: 'Hello World',
      html: output, // html body
    }

    // send mail with defined transport object
    transporter.sendMail(mailOptions, (err, info) => {
      // if (err) throw err
      if (err) console.log("error in transporter: ", err)
      console.log('Message sent', info.messageId)
      console.log('Preview')
    })
  })
}

module.exports = routes

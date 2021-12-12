'use strict'
const mailer = require('nodemailer')

async function main() {
  // generate a test SMTP account
  // only need if we do not have account

  let testAccount = mailer.createTestAccount()

  // create reusable transporter object using the default SMTP transport
  let transporter = mailer.createTransport({
    host: "smtp.ethereal.email",
    port: 587,
    secure: false, // true for 465, false for other ports
    auth: {
      user: testAccount.user,
      pass: testAccount.pass
    }
  })

  // send mail with defined transport object
  let info = await transporter.sendMail({
    from: "Yusuf Berkay Girgin",
    to: "ybgirgin3@gmail.com",
    subject: "Hello 🐧",
    text: "Hello World",
    html: "<p>Hello world</p>"
  })
  console.log("Message sent %s", info.messageId)
  // Message sent: <b658f8ca-6296-ccf4-8306-87d57a0b4321@example.com>

  // Preview only available when sending through an Ethereal account
  console.log("Preview URL: %s", mailer.getTestMessageUrl(info))
}

main().catch(console.error)


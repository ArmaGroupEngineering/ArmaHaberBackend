const jimp = require('jimp')

let url =
  'https://images.pexels.com/photos/4629485/pexels-photo-4629485.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260'

jimp
  .read(url)
  .then((image) => {
    image.resize(250, 250)
    image.writeAsync(`resize_${Date.now()}_150x150.png`)
  })
  .catch((e) => console.log(e))

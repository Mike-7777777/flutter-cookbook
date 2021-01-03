const Koa = require('koa')

const Config = require("./config")
const Router = require("./router")

const app = new Koa()

app.use(Router.routes())

app.listen(Config.listenPort, Config.listenAddress)

console.log('Server starting at port', Config.listenPort)
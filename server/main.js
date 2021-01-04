const Koa = require('koa')
const KoaStatic = require("koa-static")

const config = require("./config")
const indexRouter = require("./controllers/index")
const cookbooksRouter = require("./controllers/cookbooks")
const tagsRouter = require("./controllers/tags")
const app = new Koa()

// 静态文件
app.use(KoaStatic(__dirname + "/asserts"))

// 路由
app.use(indexRouter.routes())
app.use(cookbooksRouter.routes())
app.use(tagsRouter.routes())
// 启动服务器监听
app.listen(config.listenPort, config.listenAddress)

console.log('Server starting at port', config.listenPort)
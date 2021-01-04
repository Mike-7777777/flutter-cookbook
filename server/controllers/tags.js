// url -> /tags
const Koa_Router = require("koa-router")
const router = new Koa_Router()

const tS = require("../services/tag")

router.get("/tags",async ctx => {
    let res = tS.queryAll()
    ctx.body = res
})

module.exports = router
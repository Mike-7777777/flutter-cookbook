// url -> /
const Koa_Router = require("koa-router")
const router = new Koa_Router()

router.get("/",async ctx => {
    ctx.body = "Hellow Koa";
})

module.exports = router
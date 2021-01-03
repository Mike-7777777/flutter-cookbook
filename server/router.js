const Koa_Router = require("koa-router")

const router = new Koa_Router()

const index = require("./controllers/index")
router.get("/",index.get)

const cookbook = require("./controllers/cookbook")
router.get("/cookbook",cookbook.get)

module.exports = router
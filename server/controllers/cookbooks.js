// url -> cookbooks
const Koa_Router = require("koa-router")
const router = new Koa_Router()

const cS = require("../services/cookbook")

router.get("/cookbooks",async ctx => {
    let query = ctx.request.query
    let res = {};
    if (query.tagIds) {
        console.log("tags")
        res = cS.queryByTags()
    }else if (query.tagId){
        console.log("tag")
        res = cS.queryByTag(query.tagId)
    }else {
        res = cS.queryAll()
    }

    ctx.body = JSON.stringify(res)
})

router.get("/cookbooks/detail",async ctx => {
    let query = ctx.request.query
    // 检验必要参数
    if (!query.id) {
        responseError(ctx, "id 不能为空")
        return 
    }
    if (query.id<=0) {
        responseError(ctx, "id 不合法")
        return 
    }

    // 查询数据
    let data = cS.queryById(query.id)

    ctx.body = JSON.stringify(data)
})


function responseError(ctx,msg){
    ctx.body = msg
}


module.exports = router
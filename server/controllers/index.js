// url -> /

const db = require("../services/common").db

async function get(ctx){
    ctx.body = "Hellow Koa";
}
module.exports.get = get
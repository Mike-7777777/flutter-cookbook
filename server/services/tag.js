// 菜谱的数据库操作

const db = require("../tools/database").db

// 查询所有分类
function queryAll() {
    let sql = `
        SELECT 
        a.id,
        a.name
        FROM tags as a;
    `

    return db.prepare(sql).all();
}
module.exports.queryAll = queryAll
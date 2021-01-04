// 菜谱的数据库操作

const db = require("../tools/database").db

// 查询所有菜谱
function queryAll() {
    let sql = `
        SELECT 
        a.id,
        a.title,
        a.brief,
        b.url as priview
        FROM cookbooks as a 
        LEFT JOIN pictures as b 
        ON a.p_id = b.id;
    `

    return db.prepare(sql).all();
}
module.exports.queryAll = queryAll

// 根据id查询详细
function queryById(id) {
    // 查询某个菜谱
    let sqlQueryCookbook = `
        SELECT 
        a.id,
        a.title,
        a.brief,
        b.url as previewPicture
        FROM cookbooks as a 
        LEFT JOIN pictures as b 
        ON a.p_id = b.id
        WHERE a.id = ?;
    `
    let cookbook = db.prepare(sqlQueryCookbook).get(id)

    // 查询某个菜谱的原料及其图片
    let sqlQueryIngredients = `
        SELECT
        a.name,
        b.url as picture
        FROM ingredients as a
        LEFT JOIN pictures as b
        ON a.p_id  = b.id
        WHERE a.c_id = ? ;
    `
    let ingredients = db.prepare(sqlQueryIngredients).all(id)

    // 查询某个菜谱的所有步骤及其图片
    let sqlQueryCookSteps =`
        SELECT 
        a.number,
        a.description,
        b.url as picture
        FROM cook_steps as a
        LEFT JOIN pictures as b
        ON a.p_id = b.id 
        WHERE a.c_id = ? ;
    `
    let cookSteps = db.prepare(sqlQueryCookSteps).all(id)

    return {
        ...cookbook,
        ingredients,
        cookSteps,
    }
}
module.exports.queryById = queryById

// 根据关键词搜索一些菜谱
function queryByKeyword() {
    
}
module.exports.queryByKeyword = queryByKeyword

// 根据分类搜索菜谱，参数为 tagId：int
function queryByTag(tagId) {
    let sqlQueryCookbook = `
        SELECT
        a.id,
        a.title,
        a.brief,
        b.url as priview
        FROM cookbooks as a
        LEFT JOIN pictures as b ON a.p_id = b.id
        WHERE a.id
        IN (SELECT c.c_id
        FROM c2t as c
        WHERE c.t_id = ?)
    `
    let cookbooks = db.prepare(sqlQueryCookbook).all(tagId)
    
    return cookbooks
}
module.exports.queryByTag = queryByTag

// 根据多个分类搜索菜谱，参数为 tagIds: []int
function queryByTags(tagIds) {
    
}
module.exports.queryByTags = queryByTags


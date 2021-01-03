// 菜谱的数据库操作

// 查询所有菜谱
// SELECT 
// a.id,
// a.title,
// a.brief,
// b.url as priview
// FROM cookbooks as a LEFT JOIN pictures as b ON a.p_id = b.id; 

// 查询某个菜谱的原料及其图片
// SELECT
// a.name,
// b.url as picture
// FROM ingredients as a
// LEFT JOIN pictures as b
// ON a.p_id  = b.id
// WHERE a.c_id = 1 ;

// 查询某个菜谱的所有步骤及其图片
// SELECT 
// a.number,
// a.description,
// b.url as pictures
// FROM cook_steps as a
// LEFT JOIN pictures as b
// ON a.p_id = b.id 
// WHERE a.c_id = 1 ;

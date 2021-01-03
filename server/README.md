# server

这是该项目的后台服务器模块，该模块将独立运行，不包含在 flutter 客户端内。

## 启动方式

1. 终端进入server目录
2. 安装依赖：npm install
3. 启动服务器：node main.js

## 数据库设计

数据采用 sqlite3 ，根据需求设计，共需要 8 张表：

- cookbooks：菜谱基本信息
- ingredients：原料信息
- tags：分类信息
- cook_steps：菜谱每一步
- pictures：图片地址
- c2t：菜谱和分类信息之间的连接关系

### cookbooks

菜谱基本信息

|列|说明|类型|
| -------- | --------- | ---------- |
|id|主键|INTEGER|
|p_id|pictures的主键，封面图|INTEGER|
|title|菜谱名称|TEXT|
|brief|菜谱简介|TEXT|

### ingredients

原料信息

|列|说明|类型|
| -------- | --------- | ---------- |
|id|主键|INTEGER|
|c_id|cookbooks的主键|INTEGER|
|p_id|pictures，原料图片|INTEGER|
|name|原料名称|TEXT|

### cook_steps

菜谱每一步

|列|说明|类型|
| -------- | --------- | ---------- |
|id|主键|INTEGER|
|c_id|cookbooks的主键|INTEGER|
|p_id|pictures的主键|INTEGER|
|number|步骤号|INTEGER|
|description|步骤描述|TEXT|

### pictures

图片信息

|列|说明|类型|
| -------- | --------- | ---------- |
|id|主键|INTEGER|
|url|图片所在位置|TEXT|

### tags

分类信息

|列|说明|类型|
| -------- | --------- | ---------- |
|id|主键|INTEGER|
|name|分类名称|TEXT|

### c2t

菜谱和分类信息之间的连接关系

备注：c_id 与 t_id 为 联合主键

|列|说明|类型|
| -------- | --------- | ---------- |
|c_id|cookbooks的主键|INTEGER|
|t_id|tags的主键|INTEGER|

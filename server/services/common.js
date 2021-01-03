// 共用组件:如 database

const sqlite3 = require('sqlite3').verbose()

const config = require("../config")
const tools = require("../tools")

const database = initDatabase()
module.exports.db = database

// 初始化数据库
function initDatabase() {
    let absDbPath = path.join(tools.projectPath, config.databasePath)
    let db = new sqlite3.Database(absDbPath)
    initTable(db)
    return db;
}

// 初始化表
function initTable(db) {
    db.run(`CREATE TABLE IF NOT EXISTS cookbooks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        brief TEXT
    );`)

    db.run(`CREATE TABLE IF NOT EXISTS ingredients (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        c_id INTEGER,
        name TEXT,
        consumption TEXT
    );`)

    db.run(`CREATE TABLE IF NOT EXISTS cook_steps (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        c_id INTEGER,
        description TEXT
    );`)

    db.run(`CREATE TABLE IF NOT EXISTS pictures (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        url TEXT
    );`)

    db.run(`CREATE TABLE IF NOT EXISTS tags (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
    );`)

    db.run(`CREATE TABLE IF NOT EXISTS c2p (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        c_id INTEGER,
        p_id INTEGER
    );`)

    db.run(`CREATE TABLE IF NOT EXISTS cs2p (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        cs_id INTEGER,
        p_id INTEGER
    );`)

    db.run(`CREATE TABLE IF NOT EXISTS c2t (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        c_id INTEGER,
        t_id INTEGER
    );`)
}
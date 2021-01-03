// 共用组件:如 database
const Path = require("path")

const sqlite3 = require('better-sqlite3')

const config = require("../config")
const path = require("./path")

const database = initDatabase()
module.exports.db = database

// 初始化数据库
function initDatabase() {
    let absDbPath = Path.join(path.projectPath, config.databasePath)
    let dbOptions = {}

    if (config.isDatabaseVerbose ){
        dbOptions.verbose =  console.log
    }

    let db = new sqlite3(absDbPath, dbOptions);
    initTable(db)
    return db;
}

// 初始化表
function initTable(db) {
    db.exec(`CREATE TABLE IF NOT EXISTS cookbooks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        p_id INTEGER,
        title TEXT,
        brief TEXT
    );`)

    db.exec(`CREATE TABLE IF NOT EXISTS ingredients (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        c_id INTEGER,
        p_id INTEGER,
        name TEXT
    );`)

    db.exec(`CREATE TABLE IF NOT EXISTS cook_steps (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        c_id INTEGER,
        p_id INTEGER,
        number INTEGER,
        description TEXT
    );`)

    db.exec(`CREATE TABLE IF NOT EXISTS pictures (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        url TEXT
    );`)

    db.exec(`CREATE TABLE IF NOT EXISTS tags (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
    );`)

    db.exec(`CREATE TABLE IF NOT EXISTS c2t (
        c_id INTEGER,
        t_id INTEGER,
        PRIMARY KEY (c_id,t_id)
    );`)
}
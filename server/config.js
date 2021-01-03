const { domain } = require("process");

module.exports = {
    listenAddress:"0.0.0.0",
    listenPort:3838,

    databasePath:"/sqlite3.db", // 数据库文件相对于 server 文件夹的地址

    isDatabaseVerbose: true, // 数据库是否开启 debug 日志
}

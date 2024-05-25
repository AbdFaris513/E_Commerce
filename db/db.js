const {Pool} = require("pg");

const pool = new Pool({
  user: "postgres",
  host: "localhost", //pgsql1.uthsoftware.com
  database: "E_Commerce",
  password: "masterkey", //JfV3nsvG@2iLkrW
  port: 5432,
});

module.exports = {
  query: (text, params) => pool.query(text, params),
};

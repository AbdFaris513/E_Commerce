const db = require("../db/db");

// use in postman using get all data checks
exports.getUsers = async (req, res) => {
  try {
    const { rows, rowCount } = await db.query(
      `SELECT * FROM user_table ORDER BY usr_id`
    );

    if (rowCount != 0) {
      return res.status(200).json({
        status: true,
        message: "Users data is getted",
        data: rows,
      });
    } else {
      return res.status(200).json({
        status: false,
        message: "No data is found",
        data: [],
      });
    }
  } catch (err) {
    return res.status(404).json({
      status: false,
      message: err["message"],
    });
  }
};

// use in loginpage
exports.validateUserById = async (req, res) => {
  console.log("e");
  const userName = req.body.userName;
  const password = req.body.password;
  console.log(userName, password); // Print a Console
  try {
    const { rows, rowCount } = await db.query(
      `SELECT * FROM user_table WHERE usr_name = $1 AND usr_password = $2`,
      [userName, password]
    );

    if (rowCount != 0) {
      return res.status(200).json({
        status: true,
        message: "Users data is getted",
        data: rows,
      });
    } else {
      return res.status(200).json({
        status: false,
        message: "No data is found",
        data: [],
      });
    }
  } catch (err) {
    return res.status(404).json({
      status: false,
      message: err["message"],
    });
  }
};

// use in sign up
exports.createUsers = async (req, res) => {
  const userName = req.body.userName;
  const password = req.body.password;
  console.log(userName, password); // Print a Console
  try {
    const { rows, rowCount } = await db.query(
      `INSERT INTO user_table (usr_name,usr_password) VALUES($1,$2)`,
      [userName, password]
    );

    if (rowCount != 0) {
      return res.status(200).json({
        status: true,
        message: "Users data is Inserted",
      });
    } else {
      return res.status(200).json({
        status: false,
        message: "No data is Insert",
      });
    }
  } catch (err) {
    return res.status(404).json({
      status: false,
      message: err["message"],
    });
  }
};

// Insert a Address
exports.insertAddress = async (req, res) => {
  const address = req.body.address;
  const id = req.body.id;
  console.log(address); // Print a Console
  try {
    const { rows, rowCount } = await db.query(
      `Update user_table set usr_address = $1 WHERE usr_id = $2`,
      [address, id]
    );

    if (rowCount != 0) {
      return res.status(200).json({
        status: true,
        message: "Users data is Inserted",
      });
    } else {
      return res.status(200).json({
        status: false,
        message: "No data is Insert",
      });
    }
  } catch (err) {
    return res.status(404).json({
      status: false,
      message: err["message"],
    });
  }
};

// Find Address or alredy store or not
exports.findIsAddress = async (req, res) => {
  const id = req.body.id;
  console.log(id); // Print a Console
  try {
    const { rows, rowCount } = await db.query(
      `SELECT * FROM user_table  WHERE usr_id = $1 AND usr_address IS NOT NULL`,
      [id]
    );
    if (rowCount != 0) {
      return res.status(200).json({
        status: true,
        message: "All Ready Address Added",
        data: rows,
      });
    } else {
      return res.status(200).json({
        status: false,
        message: "No data is Insert",
      });
    }
  } catch (err) {
    return res.status(404).json({
      status: false,
      message: err["message"],
    });
  }
};

// Add a Address
exports.addAddress = async (req, res) => {
  const id = req.body.id;
  const address = req.body.address;
  const email = req.body.email;
  const name = req.body.name;
  const phone = req.body.phone;
  console.log(id, address, email, name, phone); // Print a Console
  try {
    const { rows, rowCount } = await db.query(
      `UPDATE user_table SET 
        usr_address = $1,
        usr_email = $2,
        usr_name = $3,
        usr_phone = $4 
       WHERE usr_id = $5`,
      [address, email, name, phone, id]
    );
    if (rowCount != 0) {
      return res.status(200).json({
        status: true,
        message: "Successfully Add You Address",
      });
    } else {
      return res.status(200).json({
        status: false,
        message: "No data is Insert",
      });
    }
  } catch (err) {
    return res.status(404).json({
      status: false,
      message: err["message"],
    });
  }
};

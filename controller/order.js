const db = require("../db/db");

// use in create order_table
exports.createOrders = async (req, res) => {
  const ord_user_id = req.body.ord_user_id;
  const ord_net_value = req.body.ord_net_value;
  const ord_gross_value = req.body.ord_gross_value;
  console.log(ord_user_id, ord_net_value, ord_gross_value); // Print a Console
  try {
    const { rowCount } = await db.query(
      `INSERT INTO order_table (ord_user_id,ord_net_value,ord_gross_value) VALUES($1,$2,$3) `,
      [ord_user_id, ord_net_value, ord_gross_value]
    );

    if (rowCount != 0) {
      const { rows, rowCount } = await db.query(
        `SELECT ord_order_id FROM order_table WHERE ord_user_id = $1 ORDER BY ord_order_id DESC LIMIT 1`,
        [ord_user_id]
      );
      if (rowCount != 0) {
        return res.status(200).json({
          status: true,
          message: "-- Users data is Inserted --",
          id: rows[0]["ord_order_id"],
        });
      } else {
        return res.status(200).json({
          status: false,
          message: "No data is Insert",
        });
      }
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

// use in create order_table
exports.createOrdersDetails = async (req, res) => {
  console.log("enter");
  const odl_order_id = req.body.odl_order_id;
  const odl_product_id = req.body.odl_product_id;
  const odl_product_name = req.body.odl_product_name;
  const odl_product_price = req.body.odl_product_price;
  const odl_product_quentity = req.body.odl_product_quentity;
  const odl_line_value = req.body.odl_line_value;
  console.log(
    odl_order_id,
    odl_product_id,
    odl_product_name,
    odl_product_price,
    odl_product_quentity,
    odl_line_value
  ); // Print a Console
  try {
    const { rows, rowCount } = await db.query(
      `INSERT INTO order_detail (odl_order_id,odl_product_id,odl_product_name,odl_product_price,odl_product_quentity,odl_line_value) VALUES($1,$2,$3,$4,$5,$6)`,
      [
        odl_order_id,
        odl_product_id,
        odl_product_name,
        odl_product_price,
        odl_product_quentity,
        odl_line_value,
      ]
    );

    if (rowCount != 0) {
      return res.status(200).json({
        status: true,
        message: "Users data is Inserted",
        data: rows.data,
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

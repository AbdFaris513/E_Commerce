const express = require("express");

const { createOrders, createOrdersDetails } = require("../controller/order");

const routes = express.Router();

routes.post("/create-order", createOrders);
routes.post("/create-order-details", createOrdersDetails);

module.exports = routes;

const express = require('express');

const {getUsers,validateUserById,createUsers,insertAddress,findIsAddress,addAddress} = require("../controller/users")

const routes = express.Router()

routes.get("/get-users",getUsers);
routes.post("/find-users-in-post",validateUserById);
routes.post("/create-user",createUsers);
routes.post("/insert-address",insertAddress);
routes.post("/find-address",findIsAddress);
routes.post("/add-address",addAddress);

module.exports = routes;

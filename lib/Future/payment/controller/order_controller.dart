import 'dart:convert';

import 'package:e_commerce/API/base_url.dart';
import 'package:e_commerce/Future/payment/model/order_table_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  // insert a order_table
  Future<int> orderInsert(
      int userId, double netValue, double grossValue) async {
    const String apiUrl = 'http://192.168.2.106:3100/api/v1/create-order';
    try {
      final body = {
        'ord_user_id': userId,
        'ord_net_value': netValue,
        'ord_gross_value': grossValue
      };
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: ApiConfiguration.header, // header is must
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        debugPrint(body.toString()); // debug
        final userResponse = OrderTable.fromJson(body);
        int inserted = userResponse.id ?? -1;
        print(inserted);
        return (inserted); //userResponse.data ?? <Data>[];
      } else {
        // Handle error response
        return -1; //<Data>[];
      }
    } catch (error) {
      // Handle request timeout or any other errors
      return -1; //<Data>[];
    }
  }

  // insert a order_detail_table
  Future<bool> orderDetailInsert(int orderId, int productId, String productName,
      double price, int quentity, double lineValue) async {
    const String apiUrl =
        'http://192.168.2.106:3100/api/v1/create-order-details';
    try {
      final body = {
        'odl_order_id': orderId,
        'odl_product_id': productId,
        'odl_product_name': productName,
        'odl_product_price': price,
        'odl_product_quentity': quentity,
        'odl_line_value': lineValue,
      };
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: ApiConfiguration.header, // header is must
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        debugPrint(body.toString()); // debug
        final userResponse = OrderTable.fromJson(body);
        bool inserted = userResponse.status ?? false;
        print(inserted);
        return inserted;
      } else {
        // Handle error response
        return false; //<Data>[];
      }
    } catch (error) {
      // Handle request timeout or any other errors
      return false; //<Data>[];
    }
  }
}

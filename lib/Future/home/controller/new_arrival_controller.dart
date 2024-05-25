import 'dart:convert';

import 'package:e_commerce/API/base_url.dart';
import 'package:e_commerce/API/endpoint.dart';
import 'package:e_commerce/Future/home/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewArrivalController extends GetxController {
  Future<List<Data>> getProduct() async {
    List<Data> products = await http
        .get(ApiConfiguration().getProductUrlApi(Endpoints.products))
        .then((value) {
      if (value.statusCode == 200) {
        final body = json.decode(value.body);
        final productResponse = Items.fromJson(body);
        // print(body.toString());
        return productResponse.data ?? <Data>[];
      } else {
        return <Data>[];
      }
    }).catchError((onError) {
      return <Data>[];
    }).timeout(
      const Duration(seconds: 1),
      onTimeout: () {
        return <Data>[];
      },
    );
    return products;
  }
}

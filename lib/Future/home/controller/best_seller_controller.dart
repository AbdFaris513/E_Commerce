import 'dart:convert';

import 'package:e_commerce/API/base_url.dart';
import 'package:e_commerce/API/endpoint.dart';
import 'package:e_commerce/Data/brands.dart';
import 'package:e_commerce/Future/home/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BestSellerController extends GetxController {
  Future<List<Data>> getProduct() async {
    List<Data> products = await http
        .get(ApiConfiguration()
            .getProductUrlApi(Endpoints.bestSeller)) // get 'homeProduct/0'
        .then((value) {
      if (value.statusCode == 200) {
        final body = json.decode(value.body);
        final productResponse = Items.fromJson(body);
        // print(body.toString());
        List<Data> temProduct = productResponse.data ?? <Data>[];
        for (int i = 0; i < temProduct.length; i++) {
          brandsName.add(temProduct[i].productdetail?.first.brandname ?? '');
        }
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

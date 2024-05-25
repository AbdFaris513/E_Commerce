import 'dart:convert';

import 'package:e_commerce/Future/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

class CartController extends GetxController {
  final localStorage = LocalStorage('ecommerce'); // Create local storage
  static CartController get to => Get.find(); // Singleton instance
  var cartListCont = <Data>[].obs;

  void addCartProduct(Data cartData) {
    for (int i = 0; i < cartListCont.length; i++) {
      if (cartListCont[i].productdetail?.first.recno ==
          cartData.productdetail?.first.recno) {
        return;
      }
    }
    cartListCont.add(cartData);

    // add a localstorage
    List temp = [];
    for (var item in cartListCont) {
      temp.add(item.toJson());
    }
    localStorage.setItem(
      'cartData',
      json.encode(temp),
    );
  }

  void empty() {
    cartListCont = <Data>[].obs;
    localStorage.setItem(
      'cartData',
      json.encode([]),
    );
  }

  Future<void> getCartList() async {
    cartListCont = <Data>[].obs;
    await localStorage.ready;
    final body = localStorage.getItem('cartData');
    debugPrint(body.toString());
    if (body != null) {
      final data = json.decode(body);
      debugPrint(data.toString());

      if (data != null) {
        // Ensure data is iterable before trying to loop over it
        if (data is Iterable) {
          for (var item in data) {
            if (item is Data) {
              cartListCont.add(item);
            } else {
              cartListCont.add(Data.fromJson(item));
            }
          }
        } else {
          // Handle the case where data is not iterable
          // Maybe throw an exception or handle it differently based on your requirements
        }
      } else {
        cartListCont = <Data>[].obs;
      }
    } else {
      cartListCont = <Data>[].obs;
    }
    debugPrint(cartListCont.length.toString());
  }

  void addQuentity(Data cartData) {
    for (int i = 0; i < cartListCont.length; i++) {
      if (cartData.productdetail?.first.recno ==
          cartListCont[i].productdetail?.first.recno) {
        cartListCont[i].productdetail?.first.quentity =
            (cartListCont[i].productdetail?.first.quentity ?? 1) + 1;
        cartListCont.refresh(); // Refresh to update UI
        break; // Exit loop once the product is found and updated
      }
    }
    List temp = [];
    for (var item in cartListCont) {
      temp.add(item.toJson());
    }
    localStorage.setItem('cartData', json.encode(temp));
  }

  void removeQuentity(Data cartData) {
    for (int i = 0; i < cartListCont.length; i++) {
      if (cartData.productdetail?.first.recno ==
          cartListCont[i].productdetail?.first.recno) {
        int newQuantity =
            (cartListCont[i].productdetail?.first.quentity ?? 1) - 1;
        if (newQuantity <= 0) {
          cartListCont.removeAt(i);
        } else {
          cartListCont[i].productdetail?.first.quentity = newQuantity;
        }
        cartListCont.refresh(); // Refresh to update UI
        break; // Exit loop once the product is found and updated
      }
    }
    List temp = [];
    for (var item in cartListCont) {
      temp.add(item.toJson());
    }
    localStorage.setItem('cartData', json.encode(temp));
  }

  void deleteCartList(int index) {
    cartListCont.removeAt(index); // Use removeAt method

    // set local storage
    List temp = [];
    for (var item in cartListCont) {
      temp.add(item.toJson());
    }
    localStorage.setItem('cartData', json.encode(temp));
  }

  double totalAmount() {
    double sum = 0.0;
    for (int i = 0; i < cartListCont.length; i++) {
      double? x = double.tryParse(
          cartListCont[i].productdetail?.first.salesrate ?? '0');
      int y = cartListCont[i].productdetail?.first.quentity ?? 1;
      sum += (x! * y);
      print(sum.toString());
    }
    return sum;
  }
}

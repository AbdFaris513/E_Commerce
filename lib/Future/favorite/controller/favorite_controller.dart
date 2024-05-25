import 'dart:convert';

import 'package:e_commerce/Data/brands.dart';
import 'package:e_commerce/Data/favorite_data.dart';
import 'package:e_commerce/Future/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

class FavoriteController extends GetxController {
  final localStorage = LocalStorage('ecommerceFav'); // ecommerce
  void addFavList(Data cartList) {
    for (int i = 0; i < favList.length; i++) {
      if (cartList.productdetail?.first.recno ==
          favList[i].productdetail?.first.recno) {
        return;
      }
    }
    favList += [cartList];
    // add a json in Local Storage
    List temp = [];
    for (var item in favList) {
      temp.add(item.toJson());
    }
    localStorage.setItem('favList', json.encode(temp));
  }

  Future<void> getFavList() async {
    favList = [];
    await localStorage.ready;
    final body = localStorage.getItem('favList');
    debugPrint(body.toString());
    if (body != null) {
      final data = json.decode(body);
      debugPrint(data.toString());

      if (data != null) {
        for (var item in data) {
          if (item is Data) {
            favList.add(item);
          } else {
            favList.add(Data.fromJson(item));
          }
        }
      } else {
        favList = [];
      }
    } else {
      favList = [];
    }
    debugPrint(favList.length.toString());
  }

  void removeFavList(recno) {
    for (int i = 0; i < favList.length; i++) {
      if (recno == favList[i].productdetail?.first.recno) {
        favList.removeAt(i);
        break;
      }
    }
    // add a json in Local Storage
    List temp = [];
    for (var item in favList) {
      temp.add(item.toJson());
    }
    localStorage.setItem('favList', json.encode(temp));
  }

  void addOrRemoveProductDetails(recno, bool fav) {
    // funtion is don't call a local storage becuse
    // it's already local storage cslled funtion this function call
    if (fav) {
      for (int i = 0; i < bestSellerProducts.length; i++) {
        if (recno == bestSellerProducts[i].productdetail?.first.recno) {
          bestSellerProducts[i].productdetail?.first.favorite = true;
          addFavList(bestSellerProducts[i]);
          print('add--');
          return;
        }
      }
      for (int i = 0; i < newArrivalProducts.length; i++) {
        if (recno == newArrivalProducts[i].productdetail?.first.recno) {
          newArrivalProducts[i].productdetail?.first.favorite = true;
          addFavList(newArrivalProducts[i]);
          print('add--');
          return;
        }
      }
    } else {
      removeFavList(recno);
      print('remove--');
    }
  }
}

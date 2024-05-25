import 'dart:convert';

import 'package:e_commerce/API/base_url.dart';
import 'package:e_commerce/Data/current_user.dart';
import 'package:e_commerce/Future/login/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  // Future<List<Data>> getUsers() async {
  //   List<Data> users = await http
  //       .get(ApiConfiguration().getApi(Endpoints.getUsers))
  //       .then((value) {
  //     if (value.statusCode == 200) {
  //       final body = json.decode(value.body);
  //       final userResponse = UserModel.fromJson(body); // get all john
  //       return userResponse.data ?? <Data>[];
  //     } else {
  //       return <Data>[];
  //     }
  //   }).catchError((onError) {
  //     return <Data>[];
  //   }).timeout(
  //     Duration(seconds: 25),
  //     onTimeout: () {
  //       return <Data>[];
  //     },
  //   );
  //   return users;
  // }

  Future<bool> getUsersInPost(String userName, String password) async {
    String apiUrl = 'http://192.168.2.106:3100/api/v1/find-users-in-post';
    try {
      final body = {
        'userName': userName,
        'password': password,
      };
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: ApiConfiguration.header,
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        final userResponse = UserModel.fromJson(body);
        current_user = userResponse.data ?? <Data>[];
        debugPrint(body.toString());
        return (current_user.isNotEmpty);
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}

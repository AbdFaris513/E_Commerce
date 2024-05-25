import 'dart:convert';

import 'package:e_commerce/API/base_url.dart';
import 'package:e_commerce/Future/login/model/user_model.dart';
import 'package:http/http.dart' as http;

class SignUpController{
  Future<bool> insertUsersInPost(String userName, String password) async {
    const String apiUrl = 'http://192.168.2.106:3100/api/v1/create-user';
    try {
      final body = {
          'userName': userName,
          'password': password,
        };
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: ApiConfiguration.header, // header is must
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        final body = json.decode(response.body);
        final userResponse = UserModel.fromJson(body);
        bool inserted = userResponse.status ?? false;
        return (inserted); //userResponse.data ?? <Data>[];
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
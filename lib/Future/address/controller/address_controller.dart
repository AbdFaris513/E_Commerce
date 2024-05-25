import 'dart:convert';

import 'package:e_commerce/API/base_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddressController extends GetxController {
  Future<void> addAddress(
      int id, String address, String email, String name, String phone) async {
    const String apiUrl = 'http://192.168.2.106:3100/api/v1/add-address';
    try {
      final body = {
        'id': id,
        'address': address,
        'email': email,
        'name': name,
        'phone': phone
      };
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: ApiConfiguration.header,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        print('--- Successfully add a Address ---');
        // final body = await json.decode(response.body);
        // final userResponse = Data.fromJson(body);
        // currentAddress = userResponse.data ?? <Data>[];
        // print(currentAddress.length);
        return;
      } else {
        return;
      }
    } catch (error) {
      return;
    }
  }
}

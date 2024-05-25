import 'package:e_commerce/Contant/route.dart';
import 'package:e_commerce/Future/address/view/address.dart';
import 'package:e_commerce/Future/address/view/modify_address.dart';
import 'package:e_commerce/Future/cart/view/cart.dart';
import 'package:e_commerce/Future/favorite/view/favorite.dart';
import 'package:e_commerce/Future/home/view/home.dart';
import 'package:e_commerce/Future/login/view/login.dart';
import 'package:e_commerce/Future/login/view/sign_up.dart';
import 'package:e_commerce/Future/payment/view/payment.dart';
import 'package:e_commerce/Future/product_details/product_details.dart';
import 'package:e_commerce/Future/success_page/success_page.dart';
import 'package:e_commerce/Utill/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoute.login,
      getPages: [
        GetPage(
          name: ('/login'),
          page: () => const LoginPage(),
        ),
        GetPage(
          name: ('/signup'),
          page: () => const SignUpPage(),
        ),
        GetPage(
          name: ('/homePage'),
          page: () => const HomePage(),
        ),
        GetPage(
          name: ('/cartPage'),
          page: () => const CartPage(),
        ),
        GetPage(
          name: ('/favoritePage'),
          page: () => const FavoritePage(),
        ),
        GetPage(
          name: ('/bottomNav'),
          page: () => const BottomNavPage(),
        ),
        GetPage(
          name: ('/address'),
          page: () => const SavedAddress(),
        ),
        GetPage(
          name: ('/modifyAddress'),
          page: () => const ModifyAddress(),
        ),
        GetPage(
          name: ('/paymentPage'),
          page: () => const PaymentPage(),
        ),
        GetPage(
          name: ('/successPage'),
          page: () => const SuccessPage(),
        ),
        GetPage(
          name: ('/productDetails'),
          page: () => const ProductDetails(),
        ),
      ],
    );
  }
}

import 'package:e_commerce/Future/cart/controller/cart_controller.dart';
import 'package:e_commerce/Future/cart/view/cost_and_total.dart';
import 'package:e_commerce/Future/cart/view/list_of_fav_products.dart';
import 'package:e_commerce/Utill/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController cartController = Get.put(CartController());
  bool isLoading = false;
  double subtotal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCoustom2('My Cart'), // Call App Bar Coustom Widgt
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 227, 227, 227),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: cartController.cartListCont.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListOfProductsInFavorite(
                      cartData: cartController.cartListCont[index],
                      index: index,
                    );
                  },
                ),
              ),
            ),
            TotalInMyCart(),
          ],
        ),
      ),
    );
  }
}

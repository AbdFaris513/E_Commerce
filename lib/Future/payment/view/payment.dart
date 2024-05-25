import 'package:e_commerce/Data/current_user.dart';
import 'package:e_commerce/Future/cart/controller/cart_controller.dart';
import 'package:e_commerce/Future/payment/controller/order_controller.dart';
import 'package:e_commerce/Utill/app_bar.dart';
import 'package:e_commerce/Utill/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  OrderController orderController = Get.put(OrderController());
  final CartController cartController = Get.find();
  int orderId = 0;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCoustom('Payment'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Online Payment',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 241, 241, 241),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.creditCard,
                        size: 30,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        'Online Payment',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.circle),
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Cash on Delivery',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 241, 241, 241),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.moneyBill,
                        size: 30,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        'Cash on Delivery',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.circleDot,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  double subtotalAmount = cartController.totalAmount();
                  double totalAmount = (subtotalAmount > 0
                      ? (subtotalAmount - (subtotalAmount * 0.1) + 0.1)
                      : 0);
                  orderId = await orderController.orderInsert(
                      current_user[0].usrId ?? 0, subtotalAmount, totalAmount);

                  for (int i = 0; i < cartController.cartListCont.length; i++) {
                    double price = double.parse(cartController
                            .cartListCont[i].productdetail?.first.salesrate ??
                        '0');
                    int quentity = cartController
                            .cartListCont[i].productdetail?.first.quentity ??
                        1;
                    double lineValue = price * quentity;
                    await orderController.orderDetailInsert(
                        orderId,
                        cartController
                                .cartListCont[i].productdetail?.first.recno ??
                            0,
                        cartController.cartListCont[i].productdetail?.first
                                .productname ??
                            '',
                        price,
                        quentity,
                        lineValue);
                  }
                  cartController.empty();
                  Get.toNamed('/successPage');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(18),
                    horizontal: getProportionateScreenHeight(112),
                  ),
                ),
                child: Text(
                  'Confirm Payment',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: getProportionateScreenHeight(18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

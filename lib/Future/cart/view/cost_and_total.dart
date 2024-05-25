import 'package:e_commerce/Future/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalInMyCart extends StatelessWidget {
  TotalInMyCart({super.key});
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    double subtotalAmount = cartController.totalAmount();
    double totalAmount = (subtotalAmount > 0
        ? (subtotalAmount - (subtotalAmount * 0.1) + 0.1)
        : 0);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal : ',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '${subtotalAmount.toStringAsFixed(2)} KWD',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Fee : ', style: TextStyle(fontSize: 16)),
              Text(
                '0.1 KWD',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Discount : ', style: TextStyle(fontSize: 16)),
              Text(
                '10%',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            thickness: 1.3,
            color: Color.fromARGB(255, 237, 237, 237),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total : ', style: TextStyle(fontSize: 16)),
              Text(
                totalAmount.toStringAsFixed(2),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/address');
              // print('cfe');
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.red,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 14,
              ),
            ),
            child: const Text(
              'Proceed Payment',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

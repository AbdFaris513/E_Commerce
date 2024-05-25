import 'package:e_commerce/Future/cart/controller/cart_controller.dart';
import 'package:e_commerce/Future/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ListOfProductsInFavorite extends StatefulWidget {
  Data cartData;
  int index;
  ListOfProductsInFavorite(
      {super.key, required this.cartData, required this.index});

  @override
  State<ListOfProductsInFavorite> createState() =>
      _ListOfProductsInFavoriteState();
}

class _ListOfProductsInFavoriteState extends State<ListOfProductsInFavorite> {
  final CartController cartController = Get.find();
  bool oneQuentity = false;
  int quentity = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quentity = (widget.cartData.productdetail?.first.quentity ?? 1);
    oneQuentity = (quentity) > 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image(
              height: 100,
              fit: BoxFit.cover,
              image: NetworkImage(
                  widget.cartData.productdetail?.first.imagePath.toString() ??
                      ''),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cartData.productdetail?.first.productname
                            .toString() ??
                        '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '1PCS',
                            style: TextStyle(
                              color: Color.fromARGB(255, 72, 72, 72),
                            ),
                          ),
                          Text(
                            '${widget.cartData.productdetail?.first.salesrate.toString() ?? ''} KWD',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 132, 4),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (widget.cartData.productdetail?.first
                                        .quentity !=
                                    1) {
                                  cartController
                                      .removeQuentity(widget.cartData);
                                  --quentity;
                                  oneQuentity = quentity > 1;
                                } else {
                                  //remove the cart list
                                  cartController.deleteCartList(widget.index);
                                }
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                ),
                              ),
                              child: oneQuentity
                                  ? const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    )
                                  : const Icon(
                                      Icons.delete_outlined,
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 60,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 239, 237),
                            ),
                            child: Center(
                              child: Text(
                                quentity.toString(),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                cartController.addQuentity(widget.cartData);
                                ++quentity;
                                oneQuentity = quentity > 1;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                ),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const Divider(
          color: Color.fromARGB(255, 223, 223, 223),
          thickness: 1,
        ),
      ],
    );
  }
}

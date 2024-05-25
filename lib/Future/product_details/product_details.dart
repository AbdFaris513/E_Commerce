import 'package:e_commerce/Future/cart/controller/cart_controller.dart';
import 'package:e_commerce/Future/favorite/controller/favorite_controller.dart';
import 'package:e_commerce/Future/home/model/product_model.dart';
import 'package:e_commerce/Utill/app_bar.dart';
import 'package:e_commerce/Utill/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  FavoriteController favoriteController = Get.put(FavoriteController());
  CartController cartController = Get.put(CartController());
  // Controller of cart
  List<String> imgLists = [];
  // Get a Argument Value
  late final int recno;
  late final String productname;
  late final String producttype;
  late final double salesrate;
  late int quentity;
  late final String image_path;
  late final String image_path2;
  late final String image_path3;
  late final String image_path4;
  late bool favorite;
  late Data fullDataForProduct;
  int countOfImg = 0;
  int imgCircul = 0;
  @override
  void initState() {
    super.initState();
    recno = Get.arguments['recno'];
    productname = Get.arguments['productname'];
    producttype = Get.arguments['producttype'];
    salesrate = double.parse(Get.arguments['salesrate']);
    quentity = Get.arguments['quentity'] ?? 1;
    image_path = Get.arguments['image_path'] ??
        "https://cdn.pixabay.com/photo/2013/07/12/12/57/red-146613_1280.png";
    image_path2 = Get.arguments['image_path2'] ??
        "https://cdn.pixabay.com/photo/2013/07/12/12/57/red-146613_1280.png";
    image_path3 = Get.arguments['image_path3'] ??
        "https://cdn.pixabay.com/photo/2013/07/12/12/57/red-146613_1280.png";
    image_path4 = Get.arguments['image_path4'] ??
        "https://cdn.pixabay.com/photo/2013/07/12/12/57/red-146613_1280.png";
    favorite = Get.arguments['favorite'] ?? false;
    fullDataForProduct = Get.arguments['fullDataForProduct'] ?? [];
    imgLists = [image_path, image_path2, image_path3, image_path4];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCoustom('Product Details'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  // color: Colors.grey,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: NetworkImage(imgLists[imgCircul]),
                      fit: BoxFit.contain,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return const Center(
                            child: Text('Failed to load image',
                                style: TextStyle(color: Colors.red)));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 75,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: imgLists.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              imgCircul = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: SizedBox(
                              height: 60,
                              width: 60,
                              child: CircleAvatar(
                                backgroundColor: imgCircul == index
                                    ? const Color.fromARGB(255, 254, 228, 0)
                                    : const Color.fromARGB(234, 255, 255, 255),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image(
                                    image: NetworkImage(imgLists[index]),
                                    fit: BoxFit.cover,
                                    height: 55,
                                    width: 55,
                                    errorBuilder: (BuildContext context,
                                        Object error, StackTrace? stackTrace) {
                                      return const Icon(Icons.error,
                                          color: Colors.red);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 22,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 260,
                                      child: Text(
                                        maxLines: 2,
                                        productname,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Text(
                                      producttype,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(255, 122, 122, 122),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    favorite = !favorite;
                                    favoriteController
                                        .addOrRemoveProductDetails(
                                            recno, favorite);
                                    print('Click');
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      const Color.fromARGB(255, 243, 243, 243),
                                  child: Icon(
                                    favorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: favorite ? Colors.red : Colors.black,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'د.ك $salesrate',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'د.ك ${salesrate - 0.1}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                              'Celebrate your success with our vibrant confetti animation. Enjoy a delightful visual experience as your order confirmation screen bursts with color. Seamlessly transition to the next page after a brief, joyous display.'),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 158, 158, 158),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Text(
                                '4.4'.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.star,
                                color: Color.fromARGB(
                                  255,
                                  255,
                                  230,
                                  0,
                                ),
                                size: 20,
                              ),
                              const Icon(
                                Icons.star,
                                color: Color.fromARGB(
                                  255,
                                  255,
                                  230,
                                  0,
                                ),
                                size: 20,
                              ),
                              const Icon(
                                Icons.star,
                                color: Color.fromARGB(
                                  255,
                                  255,
                                  230,
                                  0,
                                ),
                                size: 20,
                              ),
                              const Icon(
                                Icons.star,
                                color: Color.fromARGB(
                                  255,
                                  255,
                                  230,
                                  0,
                                ),
                                size: 20,
                              ),
                              const Icon(
                                Icons.star_half,
                                color: Color.fromARGB(
                                  255,
                                  255,
                                  230,
                                  0,
                                ),
                                size: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 135,
                                height: 45,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 243, 243, 243),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          quentity = quentity <= 1
                                              ? quentity
                                              : --quentity;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: CircleAvatar(
                                          backgroundColor: const Color.fromARGB(
                                              255, 0, 32, 57),
                                          radius: 22,
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Colors.white),
                                            child: const Center(
                                              child: Icon(
                                                Icons.remove,
                                                color: Color.fromARGB(
                                                    255, 0, 32, 57),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        '$quentity'.toString(), // Quentity
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          ++quentity;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: CircleAvatar(
                                          backgroundColor: const Color.fromARGB(
                                              255, 0, 32, 57),
                                          radius: 22,
                                          child: Container(
                                            width: 26,
                                            height: 26,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: const Color.fromARGB(
                                                    255, 0, 32, 57)),
                                            child: const Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  fullDataForProduct
                                      .productdetail?.first.quentity = quentity;
                                  cartController
                                      .addCartProduct(fullDataForProduct);
                                  // Get.toNamed('/cartPage');

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BottomNavPage(x: 2)),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor:
                                      const Color.fromARGB(255, 244, 219, 0),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 45,
                                    vertical: 14,
                                  ),
                                ),
                                child: const Text(
                                  'Add to cart',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

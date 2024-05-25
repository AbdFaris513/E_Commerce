import 'package:e_commerce/Data/brands.dart';
import 'package:e_commerce/Future/cart/controller/cart_controller.dart';
import 'package:e_commerce/Future/favorite/controller/favorite_controller.dart';
import 'package:e_commerce/Future/home/controller/best_seller_controller.dart';
import 'package:e_commerce/Future/home/controller/new_arrival_controller.dart';
import 'package:e_commerce/Future/home/view/best_seller.dart';
import 'package:e_commerce/Future/home/view/home_banner.dart';
import 'package:e_commerce/Future/home/view/new_arrival.dart';
import 'package:e_commerce/Utill/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _brandsInListView = 0;
  bool isLoading = false;
  List<String> brandsNameList = [];
  NewArrivalController newArrivalController = Get.put(NewArrivalController());
  BestSellerController bestSellerController = Get.put(BestSellerController());
  FavoriteController favoriteController = Get.put(FavoriteController());
  final CartController cartController = Get.put(CartController());
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      setState(() {
        isLoading = true;
      });
      // -------------------------
      await favoriteController.getFavList();
      // call a NEW ARRIVAL  controller
      await newArrivalController.getProduct().then((value) {
        if (value.isNotEmpty) {
          newArrivalProducts = value;
        }
      }).catchError((onError) {
        debugPrint(onError);
        Get.showSnackbar(GetSnackBar(
          message: onError.toString(),
        ));
      });
      // Get a local storage in CART
      await cartController.getCartList();
      // call a BEST SELLER  controller
      await bestSellerController.getProduct().then((value) {
        if (value.isNotEmpty) {
          bestSellerProducts = value;
        }
      }).catchError((onError) {
        debugPrint(onError);
        Get.showSnackbar(GetSnackBar(
          message: onError.toString(),
        ));
      });

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
    print(bestSellerProducts.length);

    // for (var element in allProductsIn0) {
    //   debugPrint(element.toJson().toString());
    //   print('---------------');
    // }
  }

  @override
  Widget build(BuildContext context) {
    // Set to List Converstion + add list in ALL in first, add see all in last
    brandsNameList = ['All'] + brandsName.toList() + ['See all'];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarCoustom2('E-Commerce'), // call a function
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: Column(
                      children: [
                        // Home Banner Code here
                        const HomeBanner(),

                        // Show title of NEW ARRIVAL
                        const SizedBox(
                          height: 14,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'New Arrival',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 93, 93, 93),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        // Call a New Arrival Widegt
                        const NewArrival(),
                        const SizedBox(
                          height: 14,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Best Seller',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                            Text(
                              'See all',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 93, 93, 93),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        SizedBox(
                          height: 30,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: brandsNameList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        _brandsInListView = index;
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13),
                                    decoration: BoxDecoration(
                                        color: _brandsInListView == index
                                            ? Colors.red
                                            : const Color.fromARGB(
                                                255, 221, 221, 221),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                        child: Text(
                                      brandsNameList[index],
                                      style: TextStyle(
                                        color: _brandsInListView == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    )),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        // Call BestSeller Home Widget
                        const BestSeller(),
                      ],
                    ),
                  ),
                ),
              ));
  }
}

import 'package:e_commerce/Future/favorite/controller/favorite_controller.dart';
import 'package:e_commerce/Future/favorite/view/fav_products.dart';
import 'package:e_commerce/Utill/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool isLoading = false;
  FavoriteController favoriteController = Get.put(FavoriteController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      setState(() {
        isLoading = true;
      });
      await favoriteController.getFavList();
      // debugPrint(favoriteController.getFavList.toString());
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCoustom2('My Favorite'),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Wishlist',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const FavoriteProducts(),
                  ],
                ),
              ),
            ),
    );
  }
}

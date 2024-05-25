import 'package:e_commerce/Data/favorite_data.dart';
import 'package:e_commerce/Future/favorite/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteProducts extends StatefulWidget {
  const FavoriteProducts({super.key});

  @override
  State<FavoriteProducts> createState() => _FavoriteProductsState();
}

class _FavoriteProductsState extends State<FavoriteProducts> {
  FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: favList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.57,
          mainAxisSpacing: 5,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed('/productDetails', arguments: {
                'recno': favList[index].productdetail?.first.recno,
                'productname': favList[index].productdetail?.first.productname,
                'producttype': favList[index].productdetail?.first.producttype,
                'salesrate': favList[index].productdetail?.first.salesrate,
                'stockqty': favList[index].productdetail?.first.stockqty,
                'image_path': favList[index].productdetail?.first.imagePath,
                'image_path2': favList[index].productdetail?.first.imagePath2,
                'image_path3': favList[index].productdetail?.first.imagePath3,
                'image_path4': favList[index].productdetail?.first.imagePath4,
                'favorite': true,
                'fullDataForProduct': favList[index],
              });
            },
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 224, 224, 224),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              favList[index].productdetail?.first.imagePath ??
                                  ''),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            favList[index]
                                    .productdetail
                                    ?.first
                                    .salesrate
                                    .toString() ??
                                0.toString(),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            (favList[index].productdetail?.first.salesrate)
                                .toString(),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        favList[index]
                                .productdetail
                                ?.first
                                .productname
                                .toString() ??
                            0.toString(),
                        maxLines: 2,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 62, 62, 62),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        favList[index]
                                .productdetail
                                ?.first
                                .producttype
                                .toString() ??
                            0.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 70,
                          ),
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          'Add',
                          style: TextStyle(),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        favoriteController.removeFavList(
                            favList[index].productdetail?.first.recno);
                      });
                    },
                    child: const CircleAvatar(
                      radius: 16,
                      backgroundColor: Color.fromARGB(255, 241, 241, 241),
                      child: Icon(
                        Icons.favorite,
                        size: 24,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

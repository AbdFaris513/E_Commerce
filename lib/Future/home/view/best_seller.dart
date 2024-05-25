import 'package:e_commerce/Data/brands.dart';
import 'package:e_commerce/Future/favorite/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BestSeller extends StatefulWidget {
  const BestSeller({super.key});

  @override
  State<BestSeller> createState() => _BestSellerState();
}

class _BestSellerState extends State<BestSeller> {
  FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: bestSellerProducts.length,
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
                'recno': bestSellerProducts[index].productdetail?.first.recno,
                'productname':
                    bestSellerProducts[index].productdetail?.first.productname,
                'producttype':
                    bestSellerProducts[index].productdetail?.first.producttype,
                'salesrate':
                    bestSellerProducts[index].productdetail?.first.salesrate,
                'quentity':
                    bestSellerProducts[index].productdetail?.first.quentity,
                'image_path':
                    bestSellerProducts[index].productdetail?.first.imagePath,
                'image_path2':
                    bestSellerProducts[index].productdetail?.first.imagePath2,
                'image_path3':
                    bestSellerProducts[index].productdetail?.first.imagePath3,
                'image_path4':
                    bestSellerProducts[index].productdetail?.first.imagePath4,
                'favorite':
                    bestSellerProducts[index].productdetail?.first.favorite,
                'fullDataForProduct': bestSellerProducts[index],
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
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(bestSellerProducts[index]
                                  .productdetail
                                  ?.first
                                  .imagePath ??
                              ''),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'د.ك ${bestSellerProducts[index].productdetail?.first.salesrate ?? ''}',
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
                            'د.ك ${bestSellerProducts[index].productdetail?.first.salesrate ?? ''}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        bestSellerProducts[index]
                                .productdetail
                                ?.first
                                .productname ??
                            '',
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
                        bestSellerProducts[index]
                                .productdetail
                                ?.first
                                .producttype ??
                            '',
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
                        bestSellerProducts[index]
                            .productdetail!
                            .first
                            .favorite = bestSellerProducts[index]
                                    .productdetail!
                                    .first
                                    .favorite ==
                                false
                            ? true
                            : false;
                        favoriteController
                            .addFavList(bestSellerProducts[index]);
                      });
                    },
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
                      child: bestSellerProducts[index]
                                  .productdetail!
                                  .first
                                  .favorite ==
                              false
                          ? const Icon(
                              Icons.favorite_border,
                              size: 24,
                              color: Colors.black,
                            )
                          : const Icon(
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

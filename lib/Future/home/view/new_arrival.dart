import 'package:e_commerce/Data/brands.dart';
import 'package:e_commerce/Future/favorite/controller/favorite_controller.dart';
import 'package:e_commerce/Utill/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewArrival extends StatefulWidget {
  const NewArrival({super.key});

  @override
  State<NewArrival> createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  FavoriteController favoriteController = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: 230,
      child: ListView.builder(
        itemCount: newArrivalProducts.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed('/productDetails', arguments: {
                'recno': newArrivalProducts[index].productdetail?.first.recno,
                'productname':
                    newArrivalProducts[index].productdetail?.first.productname,
                'producttype':
                    newArrivalProducts[index].productdetail?.first.producttype,
                'salesrate':
                    newArrivalProducts[index].productdetail?.first.salesrate,
                'quentity':
                    newArrivalProducts[index].productdetail?.first.quentity,
                'image_path':
                    newArrivalProducts[index].productdetail?.first.imagePath,
                'image_path2':
                    newArrivalProducts[index].productdetail?.first.imagePath2,
                'image_path3':
                    newArrivalProducts[index].productdetail?.first.imagePath3,
                'image_path4':
                    newArrivalProducts[index].productdetail?.first.imagePath4,
                'favorite':
                    newArrivalProducts[index].productdetail?.first.favorite,
                'fullDataForProduct': newArrivalProducts[index],
              });
            },
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 145,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 224, 224, 224),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 140,
                            decoration: BoxDecoration(
                              // color: const Color.fromARGB(255, 191, 191, 191),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image(
                              height: 130,
                              width: double.maxFinite,
                              fit: BoxFit.cover,
                              image: NetworkImage(newArrivalProducts[index]
                                      .productdetail
                                      ?.first
                                      .imagePath ??
                                  ''),
                            ),
                          ),
                          Text(
                            newArrivalProducts[index]
                                    .productdetail
                                    ?.first
                                    .productname ??
                                '',
                            style: const TextStyle(
                              fontSize: 13.1,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                newArrivalProducts[index]
                                        .productdetail
                                        ?.first
                                        .producttype ??
                                    '',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 93, 93, 93),
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'د.ك ${newArrivalProducts[index].productdetail?.first.salesrate ?? ''}',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                newArrivalProducts[index]
                                    .productdetail!
                                    .first
                                    .favorite = newArrivalProducts[index]
                                            .productdetail!
                                            .first
                                            .favorite ==
                                        false
                                    ? true
                                    : false;
                                favoriteController.addOrRemoveProductDetails(
                                    newArrivalProducts[index]
                                        .productdetail!
                                        .first
                                        .recno,
                                    newArrivalProducts[index]
                                            .productdetail!
                                            .first
                                            .favorite ??
                                        false);
                              });
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor:
                                  const Color.fromARGB(255, 240, 240, 240),
                              child: newArrivalProducts[index]
                                          .productdetail!
                                          .first
                                          .favorite ==
                                      false
                                  ? const Icon(
                                      Icons.favorite_border,
                                      size: 22,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.favorite,
                                      size: 22,
                                      color: Colors.red,
                                    ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}

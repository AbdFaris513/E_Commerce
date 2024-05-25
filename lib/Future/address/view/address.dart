import 'package:e_commerce/Data/current_user.dart';
import 'package:e_commerce/Utill/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';

class SavedAddress extends StatelessWidget {
  const SavedAddress({super.key});

  @override
  Widget build(BuildContext context) {
    String? address = current_user[0].usrAddress;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCoustom('My Saved Address'),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    // use flexible
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.home,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Aligns the text to the start
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                'Home',
                                style: TextStyle(fontSize: 22),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              address == null
                                  ? const Text(
                                      'Demo Address 1, Demo Address 2, Kuwait, 600001',
                                      softWrap: true, // Allows the text to wrap
                                      style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 121, 121, 121),
                                      ),
                                    )
                                  : Text(
                                      address.toString(),
                                      softWrap: true, // Allows the text to wrap
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 121, 121, 121),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed('/paymentPage');
                    },
                    icon: const Icon(
                      Icons.circle_outlined,
                      color: Color.fromARGB(255, 0, 150, 5),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/modifyAddress');
                },
                child: DottedBorder(
                  color: const Color.fromARGB(255, 0, 127, 4), // Border color
                  strokeWidth: 1, // Border width
                  dashPattern: const [8, 3], // Dash pattern
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    color: Colors.white,
                    child: const Center(
                        child: Text(
                      'Modify Addres',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 127, 4),
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    )),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

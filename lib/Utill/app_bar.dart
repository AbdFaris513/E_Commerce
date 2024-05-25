import 'package:flutter/material.dart';
import 'package:get/get.dart';

appBarCoustom(String titleOfAppbar) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      titleOfAppbar,
      style: const TextStyle(color: Colors.black),
    ),
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 6),
        child: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 216, 216, 216),
          radius: 16,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            ),
          ),
        ),
      )
    ],
    centerTitle: true,
  );
}

appBarCoustom2(String titleOfAppbar) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      titleOfAppbar,
      style: const TextStyle(color: Colors.black),
    ),
    elevation: 0,
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.menu,
        color: Colors.black,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 6),
        child: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 216, 216, 216),
          radius: 16,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            ),
          ),
        ),
      )
    ],
    centerTitle: true,
  );
}

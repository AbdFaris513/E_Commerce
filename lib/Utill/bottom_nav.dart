import 'package:e_commerce/Future/cart/view/cart.dart';
import 'package:e_commerce/Future/favorite/view/favorite.dart';
import 'package:e_commerce/Future/home/view/home.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  final int? x;
  const BottomNavPage({super.key, this.x});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int buttomNavIndex = 0;
  @override
  void initState() {
    super.initState();
    buttomNavIndex = widget.x ?? 0;
  }

  final List _pages = [
    const HomePage(),
    const FavoritePage(),
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[buttomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: buttomNavIndex,
        onTap: (int index) {
          setState(() {
            buttomNavIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}

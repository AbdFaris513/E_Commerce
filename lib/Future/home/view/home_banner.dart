import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const Image(
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
              image: NetworkImage(
                  "https://t3.ftcdn.net/jpg/06/82/31/12/240_F_682311292_tjoc9Ej1zJWCzKRkvpcDFMtwFljChsek.jpg"),
            ),
          ),
        ),
        Positioned(
          left: 10, // adjust this value to move the text horizontally
          top: 15, // adjust this value to move the text vertically
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get Your',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Special Sale',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Up to 50%',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            left: 15, // adjust this value to move the text horizontally
            bottom: 15,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  padding: const EdgeInsets.all(14)),
              onPressed: () {
                print('rf');
              },
              child: const Text(
                'Shop Now',
                style: TextStyle(color: Colors.white),
              ),
            ))
      ],
    );
  }
}

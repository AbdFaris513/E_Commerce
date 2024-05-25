import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 5));
    _controller.play();

    // Wait for 5 seconds and then navigate to the next page
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed("/bottomNav");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  height: 150,
                  image: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/7518/7518748.png"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Your Order Successfully Placed',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _controller,
              blastDirection: -1.0,
              emissionFrequency: 0.02,
              numberOfParticles: 30,
              maxBlastForce: 50,
              minBlastForce: 20,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
            ),
          ),
        ],
      ),
    );
  }
}

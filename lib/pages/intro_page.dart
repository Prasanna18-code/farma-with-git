import 'package:app/pages/home_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 80.0, right: 80, bottom: 80, top: 120),
            child: Image.asset('lib/images/Fruits.png'),
          ),
          const Padding(
            padding: const EdgeInsets.all(0),
            child: Text(
              "We Deliver Fresh Fruits and Groceries",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Fresh Items every day",
            style: TextStyle(color: Colors.grey[800]),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12.0),
              child: const Text(
                "Get started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}

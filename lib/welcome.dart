import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart'; // Assuming home.dart now contains your HomePage

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();

    // Navigate to the HomePage after a 3-second delay
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100, // Light green background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // A more fitting icon for an online shop for recycled goods
            const Icon(Icons.eco, size: 90, color: Colors.green),
            const SizedBox(height: 20),
            Text(
              "Trends of Change",
              style: TextStyle(
                fontSize: 32, // Slightly larger for emphasis
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800, // Darker green for text
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Your Sustainable Online Shop for Recycled Goods", // Updated tagline
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            CircularProgressIndicator(color: Colors.green.shade700),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.home, size: 80, color: Colors.green),
          SizedBox(height: 20),
          Text(
            "Welcome Home!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text("Browse or add your second-hand clothes."),
        ],
      ),
    );
  }
}

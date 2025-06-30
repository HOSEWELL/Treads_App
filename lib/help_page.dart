// lib/help_page.dart
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support"),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Need Assistance?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "We're here to help you with any questions or issues you might have while using the Trends of Change app.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 30),
            Text(
              "Contact Information:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
            const SizedBox(height: 15),
            ListTile(
              leading: Icon(Icons.email, color: Colors.green.shade600),
              title: const Text("Email Support"),
              subtitle: const Text("support@trendsofchange.com"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Email client opened (simulated).")),
                );
                // In a real app, use url_launcher: 'mailto:support@trendsofchange.com'
              },
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.green.shade600),
              title: const Text("Call Us"),
              subtitle: const Text("+123 456 7890"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Dialing (simulated).")),
                );
                // In a real app, use url_launcher: 'tel:+1234567890'
              },
            ),
            ListTile(
              leading: Icon(Icons.chat, color: Colors.green.shade600),
              title: const Text("Live Chat"),
              subtitle: const Text("Available Monday - Friday, 9 AM - 5 PM"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Opening live chat (simulated).")),
                );
                // In a real app, integrate with a chat service
              },
            ),
            const SizedBox(height: 30),
            Text(
              "FAQs & Guides:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: Colors.green.shade600),
              title: const Text("How to Buy"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Opening 'How to Buy' guide.")),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.security, color: Colors.green.shade600),
              title: const Text("Privacy Policy"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Opening Privacy Policy.")),
                );
              },
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                "Thank you for being a part of Trends of Change!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
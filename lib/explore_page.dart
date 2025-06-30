// lib/explore_page.dart
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore Trends"),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Discover More!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Dive deeper into sustainable living, new arrivals, and community initiatives.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 30),
            // Section: Latest Blog Posts/News
            Text(
              "Latest from Our Blog",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
            const SizedBox(height: 10),
            _buildExploreCard(
              context,
              title: "The Rise of Upcycling in Fashion",
              subtitle: "Learn how old clothes get a new life.",
              icon: Icons.article,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Reading blog post (simulated).")),
                );
              },
            ),
            _buildExploreCard(
              context,
              title: "Top 5 Eco-Friendly Home Decor Ideas",
              subtitle: "Decorate your space sustainably.",
              icon: Icons.home_work,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Reading blog post (simulated).")),
                );
              },
            ),
            const SizedBox(height: 30),
            // Section: Community & Social
            Text(
              "Join Our Community",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
            const SizedBox(height: 10),
            _buildExploreCard(
              context,
              title: "Follow Us on Social Media",
              subtitle: "Stay updated with our latest trends.",
              icon: Icons.public,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Opening social media links (simulated).")),
                );
              },
            ),
            _buildExploreCard(
              context,
              title: "Share Your Style",
              subtitle: "Tag us in your sustainable outfits!",
              icon: Icons.camera_alt,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Encouraging user content (simulated).")),
                );
              },
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                "Trends of Change: Sustainable. Stylish. Impactful.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExploreCard(BuildContext context, {required String title, required String subtitle, required IconData icon, required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        leading: Icon(icon, size: 30, color: Colors.green.shade600),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey.shade700)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
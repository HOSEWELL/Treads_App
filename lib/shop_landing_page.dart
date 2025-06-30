import 'package:flutter/material.dart';

class ShopLandingPage extends StatelessWidget {
  // Callback function to notify parent to navigate
  final VoidCallback? onNavigateToProducts;

  const ShopLandingPage({super.key, this.onNavigateToProducts});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // --- Hero Section / Welcome Banner ---
          Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.green.shade50, // Light green background for the banner
            child: Column(
              children: [
                Icon(
                  Icons.storefront, // A suitable icon for a shop
                  size: 100,
                  color: Colors.green.shade700,
                ),
                const SizedBox(height: 20),
                Text(
                  "Welcome to Trends of Change",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Discover unique, recycled treasures that make a difference. Shop sustainably!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    // Call the callback to notify HomePage to change the tab
                    onNavigateToProducts?.call();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Exploring our latest arrivals!')),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text("Start Shopping", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600, // Button color
                    foregroundColor: Colors.white, // Text color
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // --- Featured Categories/Sections (Dummy) ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Featured Collections",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 150, // Height for the horizontal list of categories
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              children: [
                _buildCategoryCard(context, "Apparel", Icons.checkroom),
                _buildCategoryCard(context, "Home Goods", Icons.chair),
                _buildCategoryCard(context, "Electronics", Icons.devices),
                _buildCategoryCard(context, "Books", Icons.book),
                _buildCategoryCard(context, "Accessories", Icons.watch),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // --- Why Shop With Us (Value Proposition) ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Why Choose Trends of Change?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                _buildValuePropItem(Icons.verified_user, "Quality Guaranteed", "Each item is inspected for quality and durability."),
                _buildValuePropItem(Icons.eco, "Sustainable Choices", "Reduce waste and support a circular economy."),
                _buildValuePropItem(Icons.wallet_giftcard, "Affordable Prices", "Great value on pre-loved and recycled items."),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // Helper widget to build category cards
  Widget _buildCategoryCard(BuildContext context, String title, IconData icon) {
    return Container(
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tapped on $title category!')),
            );
          },
          borderRadius: BorderRadius.circular(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.green.shade600),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to build value proposition items
  Widget _buildValuePropItem(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30, color: Colors.green.shade700),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
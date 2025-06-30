import 'package:flutter/material.dart';
import 'add_product.dart'; // Make sure to import Product and globalCartItems
import 'profile.dart';
import 'cart_page.dart'; // Import the CartPage
import 'shop_landing_page.dart'; // Import the new ShopLandingPage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Product> _cartItems = globalCartItems; // Initialize with the global list

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      // Pass the callback to ShopLandingPage
      ShopLandingPage(onNavigateToProducts: _navigateToProductsTab),
      AddProductPage(onAddToCart: _handleProductAddedToCart),
      const ProfilePage(),
    ];
  }

  // Method to change the selected index of the BottomNavigationBar
  void _navigateToProductsTab() {
    setState(() {
      _selectedIndex = 1; // Assuming 'Add Product' is at index 1
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleProductAddedToCart(Product product) {
    setState(() {
      _cartItems = globalCartItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trends of Change"),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
        actions: [
          // Cart Icon
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(cartItems: _cartItems),
                    ),
                  );
                },
              ),
              if (_cartItems.isNotEmpty)
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${_cartItems.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("No new notifications.")),
              );
            },
          )
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green.shade800,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Home',
          ),
          BottomNavigationBarItem(
           icon: Icon(Icons.store), // Changed to a store icon
           label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
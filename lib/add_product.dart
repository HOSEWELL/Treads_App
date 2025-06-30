import 'package:flutter/material.dart';

// --- ProductCategory ---
enum ProductCategory {
  clothes,
  accessories,
  books,
  homeGoods,
  electronics,
  music,
  others,
}

// --- Extension on ProductCategory (No Change) ---
extension ProductCategoryExtension on ProductCategory {
  String get displayName {
    switch (this) {
      case ProductCategory.clothes:
        return 'Clothes';
      case ProductCategory.accessories:
        return 'Accessories';
      case ProductCategory.books:
        return 'Books';
      case ProductCategory.homeGoods:
        return 'Home Goods';
      case ProductCategory.electronics:
        return 'Electronics';
      case ProductCategory.music:
        return 'Music';
      case ProductCategory.others:
        return 'Others';
    }
  }
}

// --- Product Model Class (No Change) ---
class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final ProductCategory category;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.category = ProductCategory.others,
  });
}

// --- Global Cart Items List (No Change) ---
final List<Product> globalCartItems = [];

// --- AddProductPage Widget (No Change, but its State will be updated) ---
class AddProductPage extends StatefulWidget {
  final Function(Product)? onAddToCart;

  const AddProductPage({super.key, this.onAddToCart});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

// --- _AddProductPageState (REPLACE this entire class with the code below) ---
class _AddProductPageState extends State<AddProductPage> {
  final List<Product> _allProducts = [
    // Your existing product data goes here. No changes needed to this list itself.
    Product(
      name: "Vintage Denim Jacket",
      description: "Well-preserved denim jacket from the 90s. Unisex design.",
      price: 45.00,
      imageUrl: "https://i.pinimg.com/736x/18/f2/86/18f286ae14e1fcef655694f16a0e7d87.jpg",
      category: ProductCategory.clothes,
    ),
    Product(
      name: "Floral Summer Dress",
      description: "Lightweight and airy floral dress, perfect for summer days. Size M.",
      price: 30.50,
      imageUrl: "https://i.pinimg.com/736x/98/15/8a/98158af3912ff1f72580555df9fc5877.jpg",
      category: ProductCategory.clothes,
    ),
    Product(
      name: "Striped Cotton T-Shirt",
      description: "Comfortable and classic striped t-shirt. Barely worn.",
      price: 15.00,
      imageUrl: "https://i.pinimg.com/736x/6d/2c/6c/6d2c6cae853577c179a8d2cad8e44c06.jpg",
      category: ProductCategory.clothes,
    ),
    Product(
      name: "Leather Messenger Bag",
      description: "Genuine leather bag, spacious and durable. Ideal for daily use.",
      price: 75.00,
      imageUrl: "https://i.pinimg.com/736x/6f/d0/ea/6fd0ea3515da94606d6650114336464a.jpg",
      category: ProductCategory.accessories,
    ),
    Product(
      name: "Classic Aviator Sunglasses",
      description: "Timeless design, UV protected lenses. Great condition.",
      price: 25.00,
      imageUrl: "https://i.pinimg.com/736x/c7/bb/cb/c7bbcb2318f7510fe368e29e715d1cf0.jpg",
      category: ProductCategory.accessories,
    ),
    Product(
      name: "Knitted Wool Scarf",
      description: "Warm and cozy hand-knitted scarf. Perfect for winter.",
      price: 20.00,
      imageUrl: "https://i.pinimg.com/736x/5f/eb/4c/5feb4cc34d12ea68e2f26a12acc7ed2a.jpg",
      category: ProductCategory.accessories,
    ),
    Product(
      name: "Children's Book Set",
      description: "Collection of 5 classic children's storybooks. Excellent for young readers.",
      price: 18.00,
      imageUrl: "https://i.pinimg.com/736x/15/20/7f/15207f1ddb5c9792d253e5ababa3ae9b.jpg",
      category: ProductCategory.books,
    ),
    Product(
      name: "Ceramic Coffee Mug (Set of 2)",
      description: "Hand-painted ceramic mugs, unique design. Dishwasher safe.",
      price: 12.00,
      imageUrl: "https://i.pinimg.com/736x/27/8d/8f/278d8fea7dfa942f60c925e05ba441d7.jpg",
      category: ProductCategory.homeGoods,
    ),
    Product(
      name: "Fitness Tracker Watch",
      description: "Monitors steps, heart rate, and sleep. Good battery life.",
      price: 55.00,
      imageUrl: "https://i.pinimg.com/736x/87/88/a2/8788a2969fd4587dea3d283207071c2f.jpg",
      category: ProductCategory.electronics,
    ),
    Product(
      name: "Vinyl Record: 'Groovy Tunes'",
      description: "Rare vintage vinyl album, great for collectors. Minor wear on cover.",
      price: 35.00,
      imageUrl: "https://i.pinimg.com/736x/cd/0e/1c/cd0e1c47e05ac327409ad2e177e0ffaa.jpg",
      category: ProductCategory.music,
    ),
  ];

  late Map<ProductCategory, List<Product>> _categorizedProducts;
  late Map<ProductCategory, List<Product>> _displayedCategorizedProducts;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _categorizeProducts();
    _displayedCategorizedProducts = Map.from(_categorizedProducts);
    _searchController.addListener(_filterProducts);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterProducts);
    _searchController.dispose();
    super.dispose();
  }

  void _categorizeProducts() {
    _categorizedProducts = {};
    for (var category in ProductCategory.values) {
      _categorizedProducts[category] = [];
    }
    for (var product in _allProducts) {
      _categorizedProducts[product.category]?.add(product);
    }
    _categorizedProducts.removeWhere((key, value) => value.isEmpty);
  }

  void _filterProducts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _displayedCategorizedProducts = {};
      if (query.isEmpty) {
        _displayedCategorizedProducts = Map.from(_categorizedProducts);
      } else {
        for (var categoryEntry in _categorizedProducts.entries) {
          final filteredList = categoryEntry.value.where((product) {
            return product.name.toLowerCase().contains(query) ||
                   product.description.toLowerCase().contains(query);
          }).toList();
          if (filteredList.isNotEmpty) {
            _displayedCategorizedProducts[categoryEntry.key] = filteredList;
          }
        }
      }
    });
  }

  // --- New method to show product details in a bottom sheet ---
  void _showProductDetails(Product product) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the sheet to be full height if content needs it
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      product.imageUrl,
                      height: 200, // Larger image for details view
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 150, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Category: ${product.category.displayName}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity, // Make button fill width
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      globalCartItems.add(product);
                      widget.onAddToCart?.call(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added "${product.name}" to cart!'),
                          duration: const Duration(seconds: 1), // Shorter duration
                        ),
                      );
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                    label: const Text(
                      'Add to Cart',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Add some bottom padding
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<ProductCategory, List<Product>>> categoriesToShow =
        _displayedCategorizedProducts.entries.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
        title: Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Search products...',
                hintStyle: TextStyle(color: Colors.grey.shade600),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              ),
              style: TextStyle(color: Colors.grey.shade900),
              cursorColor: Colors.green.shade700,
            ),
          ),
        ),
      ),
      body: categoriesToShow.isEmpty && _searchController.text.isNotEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.sentiment_dissatisfied, size: 80, color: Colors.green.shade400),
                  const SizedBox(height: 20),
                  Text(
                    "No Matching Products",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green.shade800),
                  ),
                  Text(
                    "Try a different search term.",
                    style: TextStyle(color: Colors.grey.shade600)),
                ],
              ),
            )
          : categoriesToShow.isEmpty && _searchController.text.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.category, size: 80, color: Colors.green.shade400),
                      const SizedBox(height: 20),
                      Text(
                        "No Products Available",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green.shade800),
                      ),
                      Text(
                        "It looks like there are no products to display yet.",
                        style: TextStyle(color: Colors.grey.shade600)),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: categoriesToShow.length,
                  itemBuilder: (context, index) {
                    final categoryEntry = categoriesToShow[index];
                    final category = categoryEntry.key;
                    final productsInCategory = categoryEntry.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            category.displayName, // Using the extension getter for category name.
                            style: const TextStyle( // Category Heading Color Change
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.green, // Changed to green for contrast
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 220,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: productsInCategory.length,
                            itemBuilder: (context, productIndex) {
                              final product = productsInCategory[productIndex];
                              return GestureDetector( // Make the entire card tappable
                                onTap: () => _showProductDetails(product), // Call the new method on tap
                                child: Container(
                                  width: 180,
                                  margin: const EdgeInsets.only(right: 16.0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Center(
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Image.network(
                                                  product.imageUrl,
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error, stackTrace) =>
                                                      const Icon(Icons.broken_image, size: 80, color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            product.name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            '\$${product.price.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          // Removed description from here
                                          const SizedBox(height: 8),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: SizedBox(
                                              height: 35,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  globalCartItems.add(product);
                                                  widget.onAddToCart?.call(product);
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                        content: Text(
                                                            'Added "${product.name}" to cart!')),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: const Color.fromARGB(255, 100, 192, 105),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  elevation: 2,
                                                ),
                                                child: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                ),
    );
  }
}
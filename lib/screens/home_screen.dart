import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/category_card.dart';
import '../widgets/promotion_banner.dart';
import '../widgets/featured_products.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'iPhone Display',
      price: 15000.0,
      imageUrl: 'https://via.placeholder.com/150',
      category: 'Display',
      description: 'High-quality iPhone display replacement',
    ),
    Product(
      id: '2',
      name: 'Samsung Battery',
      price: 8000.0,
      imageUrl: 'https://via.placeholder.com/150',
      category: 'Spare Parts',
      description: 'Original Samsung battery with warranty',
    ),
    Product(
      id: '3',
      name: 'Charging Flex',
      price: 2500.0,
      imageUrl: 'https://via.placeholder.com/150',
      category: 'Spare Parts',
      description: 'Universal charging flex cable',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'SK Lanka',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Promotion Banner
            const PromotionBanner(
              title: 'Free Shipping on All Orders',
              subtitle: 'Get free delivery on all purchases',
            ),
            
            // Categories Grid
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  CategoryCard(
                    title: 'Display',
                    icon: Icons.screen_share,
                    onTap: () {
                      Navigator.pushNamed(context, '/categories');
                    },
                  ),
                  CategoryCard(
                    title: 'Spare Parts',
                    icon: Icons.build,
                    onTap: () {
                      Navigator.pushNamed(context, '/categories');
                    },
                  ),
                  CategoryCard(
                    title: 'Hardware',
                    icon: Icons.handyman,
                    onTap: () {
                      Navigator.pushNamed(context, '/categories');
                    },
                  ),
                  CategoryCard(
                    title: 'Accessories',
                    icon: Icons.devices_other,
                    onTap: () {
                      Navigator.pushNamed(context, '/categories');
                    },
                  ),
                ],
              ),
            ),
            
            // Featured Products
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Featured Products',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            FeaturedProducts(products: _products),
            
            // Services Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Our Services',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildServiceCard(
                        icon: Icons.local_shipping,
                        title: 'Free Shipping',
                        description: 'On all orders',
                      ),
                      _buildServiceCard(
                        icon: Icons.swap_horiz,
                        title: '30-Day Guarantee',
                        description: 'Exchange policy',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
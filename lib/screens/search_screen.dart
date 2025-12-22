import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search products...',
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Popular Searches',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // Popular search terms
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildSearchChip('iPhone Display'),
                _buildSearchChip('Samsung Battery'),
                _buildSearchChip('Charging Cable'),
                _buildSearchChip('Back Glass'),
                _buildSearchChip('Camera Lens'),
                _buildSearchChip('Touch Screen'),
                _buildSearchChip('LCD'),
                _buildSearchChip('OCA Glue'),
              ],
            ),
            
            const SizedBox(height: 32),
            
            const Text(
              'Recent Searches',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // Recent searches list
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final searches = ['iPhone 12 Display', 'Samsung S21 Parts', 'Charging Flex'];
                return ListTile(
                  leading: const Icon(Icons.history, color: Colors.grey),
                  title: Text(searches[index]),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Perform search
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSearchChip(String label) {
    return ActionChip(
      label: Text(label),
      labelStyle: const TextStyle(color: Colors.blue),
      backgroundColor: Colors.grey.shade200,
      onPressed: () {
        // Perform search
      },
    );
  }
}
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Account',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Profile header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Guest User',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign in to view your account',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Account options
          _buildAccountOption(
            context: context,
            icon: Icons.login,
            title: 'Sign In',
            subtitle: 'Log in to your account',
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          
          _buildAccountOption(
            context: context,
            icon: Icons.person_add,
            title: 'Register',
            subtitle: 'Create a new account',
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
          ),
          
          const Divider(height: 1, indent: 16, endIndent: 16),
          
          _buildAccountOption(
            context: context,
            icon: Icons.history,
            title: 'Order History',
            subtitle: 'View your past orders',
            onTap: () {
              // Show message if not logged in
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please sign in to view order history'),
                ),
              );
            },
          ),
          
          _buildAccountOption(
            context: context,
            icon: Icons.card_giftcard,
            title: 'My Vouchers',
            subtitle: 'Available discounts',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please sign in to view vouchers'),
                ),
              );
            },
          ),
          
          _buildAccountOption(
            context: context,
            icon: Icons.location_on,
            title: 'Addresses',
            subtitle: 'Manage delivery addresses',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please sign in to manage addresses'),
                ),
              );
            },
          ),
          
          const Divider(height: 1, indent: 16, endIndent: 16),
          
          _buildAccountOption(
            context: context,
            icon: Icons.support_agent,
            title: 'Customer Support',
            subtitle: 'Get help with your orders',
            onTap: () {
              Navigator.pushNamed(context, '/contact');
            },
          ),

          _buildAccountOption(
            context: context,
            icon: Icons.info,
            title: 'About Us',
            subtitle: 'Learn about SK Lanka Holdings',
            onTap: () {
              Navigator.pushNamed(context, '/services');
            },
          ),
        ],
      ),
    );
  }
  
  Widget _buildAccountOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.blue),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
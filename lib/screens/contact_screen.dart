import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Contact Us',
          style: TextStyle(color: Colors.black),
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
              'Get In Touch',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We\'re here to help you with any questions',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            
            // Contact methods
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildContactOption(
                      icon: Icons.phone,
                      title: 'Phone',
                      subtitle: '+94 75 704 0411',
                      onTap: () {
                        // Make a call
                      },
                    ),
                    const Divider(height: 32),
                    _buildContactOption(
                      icon: Icons.email,
                      title: 'Email',
                      subtitle: 'info@sklanka.lk',
                      onTap: () {
                        // Send email
                      },
                    ),
                    const Divider(height: 32),
                    _buildContactOption(
                      icon: Icons.access_time,
                      title: 'Business Hours',
                      subtitle: 'Monday - Friday: 8AM - 9PM',
                      onTap: () {},
                    ),
                    const Divider(height: 32),
                    _buildContactOption(
                      icon: Icons.location_on,
                      title: 'Address',
                      subtitle: 'Colombo, Sri Lanka',
                      onTap: () {
                        // Open map
                      },
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Social media
            const Text(
              'Follow Us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSocialButton(
                  icon: Icons.facebook,
                  label: 'Facebook',
                  color: Colors.blue,
                ),
                _buildSocialButton(
                  icon: Icons.camera_alt,
                  label: 'Instagram',
                  color: Colors.pink,
                ),
                _buildSocialButton(
                  icon: Icons.call,
                  label: 'WhatsApp',
                  color: Colors.green,
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Business info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About SK Lanka Holdings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Specializing in mobile phone parts and accessories with a focus on quality and customer satisfaction. We offer wholesale and retail options for all your mobile repair needs.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildContactOption({
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
          color: Colors.blue.shade50,
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
  
  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';

class NetworkStatusBanner extends StatelessWidget {
  final bool isConnected;
  final VoidCallback onRetry;

  const NetworkStatusBanner({super.key, required this.isConnected, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    if (isConnected) {
      return const SizedBox.shrink(); // If connected, show nothing
    }

    return Material(
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Card(
          margin: const EdgeInsets.all(32.0),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.wifi_off,
                  color: Colors.red,
                  size: 64.0,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'No Internet Connection',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Please enable Wi-Fi or mobile data and try again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: onRetry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

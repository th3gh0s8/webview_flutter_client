import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import '../utils/network_status_banner.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isConnected = true; // Assume connected initially
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  static const String _webPageUrl = 'https://sklanka.lk/';

  @override
  void initState() {
    super.initState();
    _initializeConnectivity();
    _initializeWebView();
  }

  Future<void> _initializeConnectivity() async {
    final initialResult = await Connectivity().checkConnectivity();
    _updateConnectionStatus(initialResult);
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    final wasConnected = _isConnected;
    final isNowConnected = result.contains(ConnectivityResult.mobile) || result.contains(ConnectivityResult.wifi) || result.contains(ConnectivityResult.ethernet) || result.contains(ConnectivityResult.vpn);

    if (mounted && wasConnected != isNowConnected) {
      setState(() {
        _isConnected = isNowConnected;
      });
      if (isNowConnected) {
        _controller.reload();
      }
    }
  }

  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (WebResourceError error) {
            debugPrint('Page resource error: ${error.description}');
          },
        ),
      );

    if (_isConnected) {
      _controller.loadRequest(Uri.parse(_webPageUrl));
    }
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  Future<void> _retry() async {
    // Re-check connectivity and update the UI
    final connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectionStatus(connectivityResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          if (_isConnected)
            WebViewWidget(controller: _controller),

          NetworkStatusBanner(
            isConnected: _isConnected,
            onRetry: _retry,
          ),
        ],
      ),
    );
  }
}

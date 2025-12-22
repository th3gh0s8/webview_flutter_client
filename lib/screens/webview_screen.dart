import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../utils/network_status_banner.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _isConnected = true; // Assume connected initially
  final RefreshController _refreshController = RefreshController();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  static const String _webPageUrl = 'https://sklanka.lk/';

  @override
  void initState() {
    super.initState();
    _initializeConnectivity();
    _initializeWebView();
  }

  Future<void> _initializeConnectivity() async {
    // Check initial connectivity
    final initialResult = await Connectivity().checkConnectivity();
    _updateConnectionStatus(initialResult);

    // Listen for connectivity changes
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    final wasConnected = _isConnected;
    final isNowConnected = result.contains(ConnectivityResult.mobile) || result.contains(ConnectivityResult.wifi) || result.contains(ConnectivityResult.ethernet) || result.contains(ConnectivityResult.vpn);

    if (mounted) {
      setState(() {
        _isConnected = isNowConnected;
      });

      // If we just reconnected, reload the page
      if (!wasConnected && isNowConnected) {
        _controller.reload();
      }
    }
  }

  void _initializeWebView() {
    _controller = WebViewController();

    // Only set the delegate for mobile platforms
    if (!kIsWeb) {
      _controller.setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) => setState(() => _isLoading = true),
          onPageFinished: (String url) => setState(() => _isLoading = false),
          onWebResourceError: (WebResourceError error) {
            debugPrint('Page resource error: ${error.description}');
          },
        ),
      );
    }

    // Load the initial URL if we are connected
    if (_isConnected) {
      _controller.loadRequest(Uri.parse(_webPageUrl)).then((_) {
        if (mounted && kIsWeb) {
          setState(() => _isLoading = false);
        }
      });
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

  Future<void> _refreshPage() async {
    await _controller.reload();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Only show the WebView if connected
          if (_isConnected)
            SmartRefresher(
              controller: _refreshController,
              onRefresh: _refreshPage,
              child: WebViewWidget(controller: _controller),
            ),
          
          // Show loading indicator only on mobile and when connected
          if (!kIsWeb && _isLoading && _isConnected)
            const Center(
              child: CircularProgressIndicator(),
            ),

          // Show the offline banner when not connected
          NetworkStatusBanner(
            isConnected: _isConnected,
            onRetry: _retry,
          ),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
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
    final isNowConnected = result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.ethernet) ||
        result.contains(ConnectivityResult.vpn);

    if (mounted && wasConnected != isNowConnected) {
      setState(() {
        _isConnected = isNowConnected;
      });
      // Only reload if we just reconnected
      if (isNowConnected && !wasConnected) {
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
    final connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectionStatus(connectivityResult);
  }

  Future<void> _handleRefresh() async {
    // Use a completer to ensure the Future from onRefresh completes
    final Completer<void> completer = Completer<void>();
    await _controller.reload();
    completer.complete();
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make status bar background transparent
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark, // Use dark icons for status bar
        ),
        toolbarHeight: 0, // Only color the status bar area
      ),
      body: SafeArea(
        top: true,
        child: _isConnected
            ? RefreshIndicator(
          onRefresh: _handleRefresh,
          child: WebViewWidget(
            controller: _controller,
            // This allows both the webview and the RefreshIndicator to recognize vertical drags
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
              Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer(),
              ),
            },
          ),
        )
            : Center(
          child: NetworkStatusBanner(
            isConnected: _isConnected,
            onRetry: _retry,
          ),
        ),
      ),
    );
  }
}

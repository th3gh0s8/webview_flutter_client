import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  final RefreshController _refreshController = RefreshController();

  // Replace this with your actual PHP web page URL
  static const String _webPageUrl = 'https://sklanka.lk/';

  @override
  void initState() {
    super.initState();

    _controller = WebViewController();

    // Platform-specific configurations
    if (!kIsWeb) {
      _controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (String url) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
            },
            onWebResourceError: (WebResourceError error) {
              debugPrint('Web resource error: ${error.description}');
            },
          ),
        );
    } else {
      // On web, we can't easily track loading state, so we'll just hide the indicator.
      _isLoading = false;
    }

    _controller.loadRequest(Uri.parse(_webPageUrl));
  }

  Future<void> _refreshPage() async {
    await _controller.reload();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _refreshPage,
      child: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}

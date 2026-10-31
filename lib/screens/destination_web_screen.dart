import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DestinationWebScreen extends StatefulWidget {
  final String name;

  const DestinationWebScreen({
    super.key,
    required this.name,
  });

  @override
  State<DestinationWebScreen> createState() =>
      _DestinationWebScreenState();
}

class _DestinationWebScreenState
    extends State<DestinationWebScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..loadRequest(
        Uri.parse(
          'https://en.wikipedia.org/wiki/${Uri.encodeComponent(widget.name)}',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
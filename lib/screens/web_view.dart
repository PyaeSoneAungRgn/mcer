import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WebViewArguments args = ModalRoute.of(context).settings.arguments;

    return WebviewScaffold(
      url: args.url,
      appBar: AppBar(
        title: Text(args.title),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class WebViewArguments {
  final String title;
  final String url;

  WebViewArguments(this.title, this.url);
}

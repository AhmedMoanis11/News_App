import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web extends StatelessWidget {
 final String urll;

  const Web(this.urll);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl:urll ,
      ),
    );
  }
}

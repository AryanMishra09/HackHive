import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  const WebViewContainer({super.key});

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {

//  static String sampleHtml = '''
// <!DOCTYPE html>
// <html lang="en">
// <head>
// <title>Load file or HTML string example</title>
// </head>
// <body>
//
// <h1>Local demo page</h1>
// <p>
//   This is an example page used to demonstrate how to load a local file or HTML
//   string using the <a href="https://pub.dev/packages/webview_flutter">Flutter
//   webview</a> plugin.
// </p>
//
// </body>
// </html>
// ''';

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://google.com'));
  //..loadHtmlString(sampleHtml);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WebView'),
        ),
        body: WillPopScope(
          // Intercept back button press
          onWillPop: () async {
            if (await controller.canGoBack()) {
              controller.goBack();
              return false;
            } else {
              return true;
            }
          },
          child: WebViewWidget(controller: controller),
        ));
  }
}

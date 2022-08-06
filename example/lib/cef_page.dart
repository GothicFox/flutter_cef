import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_cef/webview_cef.dart';

class CefPage extends StatefulWidget {
  CefPage({Key? key, required this.url}) : super(key: key);
  String url;

  @override
  State<CefPage> createState() => _CefPageState();
}

class _CefPageState extends State<CefPage> {
  final _controller = WebviewController();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    _textController.text = widget.url;
    await _controller.initialize();
    await _controller.loadUrl(widget.url);
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Webview CEF Plugin'),
          ),
          body: Column(
            children: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "返回",
                        style: TextStyle(
                            fontSize: 20, backgroundColor: Colors.yellow),
                      )),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      onSubmitted: (url) {
                        widget.url = url;
                        _textController.text = url;
                        _controller.loadUrl(url);
                      },
                    ),
                  ),
                ],
              ),
              _controller.value
                  ? Expanded(child: Webview(_controller))
                  : const Text("not init"),
            ],
          )),
    );
  }
}

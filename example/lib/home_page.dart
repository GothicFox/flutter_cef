import 'package:flutter/material.dart';
import 'package:webview_cef_example/cef_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: (){
          print('open cef page');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CefPage(url: "https://www.baidu.com"),
            ),
          );
        },
        child: const Text(
          "jump cef page",
          style: TextStyle(fontSize: 30, backgroundColor: Colors.black12),
        ),
      ),
    );
  }
}

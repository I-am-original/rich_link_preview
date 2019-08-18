import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:rich_link_preview/src/rich_link_preview.dart';

void main() => runApp(RichLinkPreviewExample());

class RichLinkPreviewExample extends StatefulWidget {
  @override
  _RichLinkPreviewExampleState createState() =>
      new _RichLinkPreviewExampleState();
}

class _RichLinkPreviewExampleState extends State<RichLinkPreviewExample> {
  TextEditingController _textController = new TextEditingController();
  String _link;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _link = _textController.text;
      });
    });
  }

  void _onTextChange(String val) {
    setState(() {
      _link = _textController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green,
          hintColor: Colors.green,
        ),
        home: Scaffold(
            body: Builder(
          builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: RichLinkPreview(
                          link:
                              'https://www.instagram.com/p/B1Rde-4g_C4/?igshid=dvpcvjhf2e8o',
                          appendToLink: true,
                          launchFromLink: true)),
                  RichLinkPreview(
                      link: _link,
                      borderColor: Color(0xFFE0E0E0),
                      backgroundColor: Color(0xFFE0E0E0)),
                  TextField(
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                    ),
                    controller: _textController,
                    onChanged: (String val) => _onTextChange(val),
                  )
                ],
              )),
        )));
  }
}

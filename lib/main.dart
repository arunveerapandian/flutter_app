import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage (title: 'Quik Tech Software'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _launchURL(url) async {
    const url = 'https://quiktech.co.in';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/QTS.jpeg',
              width: 400.0,
              height: 240.0,
              //fit: BoxFit.cover,
            ),
            Text(
              'You have opened the link $_counter times',
              style: TextStyle(color:Colors.red),
            ),
            RaisedButton(
              onPressed: () {
                print("Button Pressed");
                _launchURL('https://quiktech.co.in');
                setState(() {
                  _counter++;
                });
              },
              child: Text("Open"),
            )
          ],
        ),
      ),
    );
  }
}


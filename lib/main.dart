import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;

bool get isIOS => foundation.defaultTargetPlatform == TargetPlatform.iOS;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (isIOS) {
      print('IOS');
    } else {
      print('Android');
    }
    return isIOS
        ? CupertinoApp(
          debugShowCheckedModeBanner: false,
            theme: CupertinoThemeData(primaryColor: Colors.red),
            title: 'Flutter Demo',
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          )
        : MaterialApp(
          debugShowCheckedModeBanner: false,
            theme: ThemeData(primaryColor: Colors.red),
            title: 'Flutter Demo',
            home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  Widget build(BuildContext context) {
    Widget _content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.display1,
          ),
          isIOS
              ? CupertinoButton.filled(
                  child: Text('Increment'),
                  onPressed: _incrementCounter,
                )
              : RaisedButton(
                  child: Text('Increment'),
                  onPressed: _incrementCounter,
                ),
        ],
      ),
    );
    return isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Home'),
            ),
            child: _content)
        : Scaffold(
            appBar: AppBar(
              title: Text('Home'),
              centerTitle: true,
            ),
            body: _content,
          );
  }
}
 
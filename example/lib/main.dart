import 'package:flutter/material.dart';
import 'package:indicator_button/indicator_button.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indicator Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Indicator Button Demo'),
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
            Text(
              'Tap the button:',
            ),
            SizedBox(
              height: 30,
            ),
            _createFollowButton(),
          ],
        ),
      ),
    );
  }

  int _targetUserId = 123;
  List<int> _followingUserIdList = [123];

  Widget _createFollowButton() {
    var followed = _followingUserIdList.contains(_targetUserId);
    var buttonText = followed ? 'Following' : ' +  Follow';
    var buttonBackgroundColor = followed ? Colors.white30 : Colors.white;
    var borderColor = followed ? Colors.grey : Colors.blue;
    var textColor = followed ? Colors.grey : Colors.blue;

    var button = IndicatorButton(
      backgroundColor: buttonBackgroundColor,
      progressColor: textColor,
      borderColor: borderColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.remove_red_eye,
            size: 20.0,
            color: textColor,
          ),
          Text(
            buttonText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: textColor,
            ),
          ),
        ],
      ),
      onPressed: () async {
        await Future.delayed(new Duration(milliseconds: 2000), () {
          setState(() {
            if (followed) {
              _followingUserIdList.remove(_targetUserId);
            } else {
              _followingUserIdList.add(_targetUserId);
            }
          });
        });
      },
    );

    return Container(
      width: 130.0,
      height: 32.0,
      child: button,
    );
  }
}

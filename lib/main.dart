import 'package:flutter/material.dart';
import 'package:flashlight/flashlight.dart';
import 'dart:async';

import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool _hasFlashlight = false;

  @override
  initState() {
    super.initState();
    initFlashlight();
  }

  initFlashlight() async {
    bool hasFlash = await Flashlight.hasFlashlight;
    print("Device has flash ? $hasFlash");
    setState(() {
      _hasFlashlight = hasFlash;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          buttonColor: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Control your flashlight'),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(_hasFlashlight
                    ? 'Your phone has a Flashlight.'
                    : 'Your phone has no Flashlight.'),
                RaisedButton(
                  textColor: Colors.white,
                  child: Text('SWITCH IT ON'),
                  onPressed: () => Flashlight.lightOn(),
                ),
                RaisedButton(
                  textColor: Colors.white,
                  child: Text('SWITCH IT OFF'),
                  onPressed: () => Flashlight.lightOff(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

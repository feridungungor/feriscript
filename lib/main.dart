import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      backgroundColor: Colors.teal,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          Positioned(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: infoCard(context, "Hello Cınım"),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: frostedIconButton(
                      IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ), //Stack,
      bottomNavigationBar: myCurvedNavigationBar(),
    );
  }

  CurvedNavigationBar myCurvedNavigationBar() {
    return CurvedNavigationBar(
      color: Colors.teal,
      buttonBackgroundColor: Colors.teal,
      backgroundColor: Colors.white,
      height: 60,
      animationDuration: Duration(milliseconds: 300),
      animationCurve: Curves.ease,
      index: 2,
      items: <Widget>[
        Icon(
          Icons.verified_user,
          size: 20,
          color: Colors.white,
        ),
        Icon(
          Icons.favorite,
          size: 20,
          color: Colors.white,
        ),
        Icon(
          Icons.fullscreen_exit,
          size: 20,
          color: Colors.white,
        ),
        Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        ),
        Icon(
          Icons.list,
          size: 20,
          color: Colors.white,
        ),
      ],
      onTap: (index) {
        debugPrint("Current Index is $index");
      },
    );
  }
}

Widget frostedIconButton(Widget child) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3), shape: BoxShape.circle),
              child: child)));
}
Widget infoCard(BuildContext context, String title) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 10.9,
        sigmaY: 10.0,
      ),
      child: Container(
        key: ValueKey<String>(title),
        height: MediaQuery.of(context).size.height / 4,
        width: MediaQuery.of(context).size.width / 1.2,
        color: Colors.white.withOpacity(0.3),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Feridun Güngör",
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

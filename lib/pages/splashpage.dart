import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive2021_crud/pages/homepage.dart';
import 'package:hive2021_crud/utilities/usable_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2),
        () => pushRouteReplacement(context, widget: HomePage()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.grey,
        child: Text(
          "H",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.headline5!.fontSize,
          ),
        ),
      ),
    ));
  }
}

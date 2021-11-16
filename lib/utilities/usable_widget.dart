import 'package:flutter/material.dart';

pushRoute(context, {required Widget widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (_) => widget));

pushRouteReplacement(context, {required Widget widget}) =>
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(builder: (BuildContext context) => widget),
    );

AppBar appBar() {
  return AppBar(
    title: const Text("Hivvy"),
  );
}

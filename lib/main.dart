import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive2021_crud/model/profile_model.dart';
import 'package:hive2021_crud/pages/splashpage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  // register with the help of ProfileAdapter
  Hive.registerAdapter(ProfileAdapter());
  // open new box
  await Hive.openBox<Profile>("myprofilebox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const SplashPage(),
    );
  }
}

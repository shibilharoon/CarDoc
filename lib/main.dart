import 'package:cardoc/model/data_model.dart';
import 'package:cardoc/screens/bottom_bar.dart';
import 'package:cardoc/screens/home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CustomerModelAdapter().typeId)) {
    Hive.registerAdapter(CustomerModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:ScreenSplash(),
    );
  }
}

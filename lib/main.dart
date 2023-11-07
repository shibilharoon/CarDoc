import 'package:cardoc/controllers/date_provider.dart';
import 'package:cardoc/controllers/db_provider.dart';
import 'package:cardoc/controllers/page_provider.dart';
import 'package:cardoc/model/data_model.dart';
import 'package:cardoc/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DbProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => pageProvider(),
        ),
        ChangeNotifierProvider(create: (context) => DateProvider(),)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenSplash(),
      ),
    );
  }
}

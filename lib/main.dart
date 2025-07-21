import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_store/home.dart';
import 'package:hive_store/model/class.dart';

void main()async{
WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();
Hive.registerAdapter(DataAdapter());
await Hive.openBox<Data>('DataSaving');
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
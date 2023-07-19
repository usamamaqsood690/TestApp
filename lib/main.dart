import 'package:flutter/material.dart';
import 'package:test_app/screens/splach.dart';
import 'package:test_app/widgets/notifi.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Notifi().initializeNotification();
  Notifi().showNotification(1, "Happy Ramzan", "Ready for Ramzan");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Test App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplachScreen());
  }
}

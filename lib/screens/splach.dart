import 'package:flutter/material.dart';
import 'package:test_app/screens/privacy.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const PrivacyScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Splach Screen')),
      body: Container(
        alignment: Alignment.center,
        child: const Text('Loading...'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_app/screens/bottom_nav_bar.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Screen')),
      body: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            child: const Text('Move to Main Screen'),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const BNavBar()),
                  (route) => false);
            },
          )),
    );
  }
}

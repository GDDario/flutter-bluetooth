import 'package:flutter/material.dart';

class BlePage extends StatefulWidget {
  const BlePage({super.key});

  @override
  State<BlePage> createState() => _BlePageState();
}

class _BlePageState extends State<BlePage> {
  @override
  void dispose() {
    super.dispose();
    print("Disposing classic page");
  }

  @override
  Widget build(BuildContext context) {
    return Text("BLE");
  }
}

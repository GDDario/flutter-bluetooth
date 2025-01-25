import 'package:flutter/material.dart';

class ClassicPage extends StatefulWidget {
  const ClassicPage({super.key});

  @override
  State<ClassicPage> createState() => _ClassicPageState();
}

class _ClassicPageState extends State<ClassicPage> {


  @override
  Widget build(BuildContext context) {
    return Text("Classic");
  }

  @override
  void dispose() {
    super.dispose();
    print("Disposing classic page");
  }
}

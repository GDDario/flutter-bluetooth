import 'package:flutter/material.dart';
import 'package:flutter_bluetooth/widgets/ble_page.dart';
import 'package:flutter_bluetooth/widgets/classic_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bluetooth',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Bluetooth Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onIndexChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Classic',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'BLE',
      ),
    ];
    const pages = [
      ClassicPage(),
      BlePage()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        onTap: _onIndexChange,
        currentIndex: _selectedIndex,
      ),
    );
  }
}

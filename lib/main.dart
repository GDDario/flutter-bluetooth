import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_bluetooth/widgets/ble_page.dart';
import 'package:flutter_bluetooth/widgets/classic_page.dart';
import 'package:flutter_bluetooth/widgets/configuration_page.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (await FlutterBluePlus.isSupported == false) {
    print("Bluetooth not supported by this device");
    return;
  }

  await checkAndRequestBluetoothPermissions();

  runApp(const MyApp());
}

Future<void> checkAndRequestBluetoothPermissions() async {
  if (await Permission.bluetooth.isDenied) {
    await Permission.bluetooth.request();
  }
  if (await Permission.bluetoothConnect.isDenied) {
    await Permission.bluetoothConnect.request();
  }
  if (await Permission.bluetoothScan.isDenied) {
    await Permission.bluetoothScan.request();
  }
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
        label: "Configuration",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bluetooth),
        label: "Classic",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bluetooth_connected),
        label: "BLE",
      ),
    ];
    const pages = [ConfigurationPage(), ClassicPage(), BlePage()];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        onTap: _onIndexChange,
        currentIndex: _selectedIndex,
      ),
    );
  }
}

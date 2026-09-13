import 'package:flutter/material.dart';
import 'util/smart_device_box.dart'; // Relative import avoids package name mismatches

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Lowercase variable name following Dart conventions
  final List<List<dynamic>> devices = [
    ["Smart Light", "lib/icons/smart-light_5042413.png", false],
    ["Smart TV", "lib/icons/smart-tv_2983703.png", false],
    ["Smart AC", "lib/icons/air-conditioning_5879385.png", false],
    ["Smart Fan", "lib/icons/fan_8955103.png", false],
  ];

  void powerSwitchChanged(bool? value, int index) {
    if (value == null) return;
    setState(() {
      devices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom App Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.home, size: 45, color: Colors.grey[800]),
                  Icon(Icons.settings, size: 45, color: Colors.grey[800]),
                ],
              ),
            ),

            // Welcome Text
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome home",
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  const Text(
                    "PROPER POGO",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Section Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "Smart Devices",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            // Grid of Devices
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: GridView.builder(
                  itemCount: devices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return SmartDeviceBox(
                      smartDeviceName: devices[index][0],
                      iconPath: devices[index][1],
                      powerOn: devices[index][2],
                      onChanged: (value) => powerSwitchChanged(value, index),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

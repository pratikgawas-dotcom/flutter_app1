import 'package:flutter/material.dart';
import 'package:flutter_app1/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List Devices = [
    ["Smart Light", "lib/icons/smart-light_5042413.png", false],
    ["Smart TV", "lib/icons/smart-tv_2983703.png", false],
    ["Smart AC", "lib/icons/air-conditioning_5879385.png", false],
    ["Smart Fan", "lib/icons/fan_8955103.png", false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      Devices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.home, size: 50, color: Colors.white),
                Icon(Icons.settings, size: 50, color: Colors.white),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome home"),
                Text(
                  "PROPER POGO",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 0.0,
            ),
            child: Text(
              "Smart Devices",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: GridView.builder(
                itemCount: Devices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: Devices[index][0],
                    iconPath: Devices[index][1],
                    powerOn: Devices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

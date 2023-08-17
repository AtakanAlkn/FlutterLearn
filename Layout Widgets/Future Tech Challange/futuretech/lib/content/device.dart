import 'package:flutter/material.dart';

class Device extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Device({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Device',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                DeviceCard(
                  deviceName: 'TV',
                  iconData: Icons.tv,
                  hasSwitch: true, // Switch
                ),
                DeviceCard(
                  deviceName: 'Lamp',
                  iconData: Icons.lightbulb_outline,
                  hasSwitch: true, // Switch
                ),
                DeviceCard(
                  deviceName: 'Curtain',
                  iconData: Icons.crop_square,
                  hasSlider: true, // Slider
                ),
                DeviceCard(
                  deviceName: 'Wi-Fi',
                  iconData: Icons.wifi,
                  hasSwitch: true, // Switch
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DeviceCard extends StatefulWidget {
  final String deviceName;
  final IconData iconData;
  final bool hasSwitch;
  final bool hasSlider;

  const DeviceCard({
    Key? key,
    required this.deviceName,
    required this.iconData,
    this.hasSwitch = false,
    this.hasSlider = false,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  bool isCardTapped = false;
  bool isSwitchOn = false;
  double curtainSliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    final Color cardColor =
        isCardTapped ? const Color(0XFFEE78A0) : Colors.white;

    return InkWell(
      onTap: () {
        setState(() {
          isCardTapped = !isCardTapped;
        });
      },
      child: Card(
        color: cardColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 120, left: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.iconData,
                size: 48,
                color: Colors.black,
              ),
              const SizedBox(height: 8),
              Text(
                widget.deviceName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              if (widget.hasSwitch)
                Switch(
                  value: isSwitchOn,
                  onChanged: (value) {
                    setState(() {
                      isSwitchOn = value;
                    });
                  },
                ),
              if (widget.hasSlider)
                Slider(
                  value: curtainSliderValue,
                  onChanged: (newValue) {
                    setState(() {
                      curtainSliderValue = newValue;
                    });
                  },
                ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

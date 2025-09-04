import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool on = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: on,
      activeColor: const Color.fromARGB(99, 12, 161, 7),
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          on = value;
        });
      },
    );
  }
}

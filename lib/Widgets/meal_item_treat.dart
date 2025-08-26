import 'package:flutter/material.dart';

class MealItemTreat extends StatelessWidget {
  final String label;
  final IconData icon;

  const MealItemTreat({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 17, color: Colors.white),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}

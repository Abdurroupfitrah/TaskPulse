import 'package:flutter/material.dart';

class PriorityBadge extends StatelessWidget {
  final String priority;

  const PriorityBadge({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color textColor;

    if (priority == 'Tinggi') {
      bg = const Color(0xFFFEE2E2);
      textColor = const Color(0xFFEF4444);
    } else if (priority == 'Sedang') {
      bg = const Color(0xFFFEF3C7);
      textColor = const Color(0xFFF59E0B);
    } else {
      bg = const Color(0xFFD1FAE5);
      textColor = const Color(0xFF10B981);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        priority,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
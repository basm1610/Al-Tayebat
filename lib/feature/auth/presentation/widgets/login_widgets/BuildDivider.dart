import 'package:flutter/material.dart';

class BuildDivider extends StatelessWidget {
  final String text;
  const BuildDivider({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: Colors.white.withOpacity(0.12), thickness: 1),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 13,
            ),
          ),
        ),
        Expanded(
          child: Divider(color: Colors.white.withOpacity(0.12), thickness: 1),
        ),
      ],
    );
  }
}


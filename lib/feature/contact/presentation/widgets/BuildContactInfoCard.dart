import 'package:flutter/material.dart';

class BuildContactInfoCard extends StatelessWidget {
  final String label;
  final String content;
  final IconData icon;
  final Color iconColor;
  final TextStyle? contentStyle;

  const BuildContactInfoCard({super.key, 
    required this.label,
    required this.content,
    required this.icon,
    required this.iconColor,
    this.contentStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  label,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 12,
                    fontFamily: 'Cairo',
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  content,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style:
                      contentStyle ??
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Cairo',
                        height: 1.5,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: iconColor.withOpacity(0.3), width: 1),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
        ],
      ),
    );
  }
}
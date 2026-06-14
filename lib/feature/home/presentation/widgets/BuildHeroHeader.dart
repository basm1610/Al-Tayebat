import 'package:flutter/material.dart';

class HeroHeader extends StatelessWidget {
  const HeroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'استمتع بأشهى\nالأطباق الشرقية.',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Cairo',
              fontSize: 26,
              fontWeight: FontWeight.w800,
              height: 1.3,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'اكتشف وجبتك المفضلة الليلة.',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.white54,
              fontFamily: 'Cairo',
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
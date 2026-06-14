import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Row(
          textDirection: TextDirection.rtl,
          children: [
            SizedBox(width: 14),
            Icon(Icons.search, color: Color(0xFF888888), size: 20),
            SizedBox(width: 10),
            Text(
              'ابحث عن وجبة، برجر، مشاوي...',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Color(0xFF888888),
                fontFamily: 'Cairo',
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
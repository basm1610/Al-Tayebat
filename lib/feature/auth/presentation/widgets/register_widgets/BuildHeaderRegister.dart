import 'package:flutter/material.dart';

class BuildHeaderRegister extends StatelessWidget {
  const BuildHeaderRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'إنشاء حساب جديد',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'انضم إلينا واستمتع بأشهى الوجبات',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white.withOpacity(0.65),
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
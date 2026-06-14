import 'package:flutter/material.dart';

class BuildIngredients extends StatelessWidget {
  const BuildIngredients({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'صدر دجاج مقلي ومقرمش متبل بخلطة الطيبات الحارة السرية، يقدم مع شرائح الجبن الشيدر الغنية، الخس الطازج، و صوص المايونيز الحار في خبز البريوش المحمص بالزبدة.',
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      style: TextStyle(
          fontSize: 14,
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(0.65),
          height: 1.7),
    );
  }
}


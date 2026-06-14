import 'package:apppp/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class BuildSpicePicker extends StatefulWidget {
  const BuildSpicePicker({super.key});

  @override
  State<BuildSpicePicker> createState() => _BuildSpicePickerState();
}

class _BuildSpicePickerState extends State<BuildSpicePicker> {
  int selectedSpice = 1; // 0=عادي 1=حار 2=نار

  final List<String> spiceLevels = ['عادي', 'حار', 'نار'];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(spiceLevels.length, (i) {
        final sel = i == selectedSpice;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
            onTap: () => setState(() => selectedSpice = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                color: sel ? AppColor.kOrange : AppColor.kInputBg,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Text(
                spiceLevels[i],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: sel ? FontWeight.w700 : FontWeight.w400,
                  // ignore: deprecated_member_use
                  color: sel ? Colors.white : Colors.white.withOpacity(0.6),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

import 'dart:developer';

import 'package:apppp/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class BuildExtra extends StatefulWidget {
  final ValueChanged<int> onTotalChanged;

  const BuildExtra({super.key, required this.onTotalChanged});

  @override
  State<BuildExtra> createState() => _BuildExtraState();
}

class _BuildExtraState extends State<BuildExtra> {
  final Set<int> _selectedExtras = {};

  final List<Map<String, dynamic>> extras = [
    {'name': 'جبنة إضافية', 'price': 15},
    {'name': 'صوص الطيبات', 'price': 10},
    {'name': 'هالبينو', 'price': 8},
    {'name': 'بيكن بقري', 'price': 25},
  ];

  int get totalExtrasPrice {
    int total = 0;

    for (final index in _selectedExtras) {
      total += extras[index]['price'] as int;
    }

    return total;
  }

  void _toggleExtra(int index) {
    setState(() {
      if (_selectedExtras.contains(index)) {
        _selectedExtras.remove(index);
      } else {
        _selectedExtras.add(index);
      }
    });

    widget.onTotalChanged(totalExtrasPrice);
    // log("message : ${totalExtrasPrice}");
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3.2,
      ),
      itemCount: extras.length,
      itemBuilder: (context, index) {
        final isSelected = _selectedExtras.contains(index);

        return GestureDetector(
          onTap: () => _toggleExtra(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColor.kOrange.withOpacity(0.15)
                  : AppColor.kInputBg,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: isSelected
                    ? AppColor.kOrange
                    : Colors.white.withOpacity(0.08),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '+ ${extras[index]['price']} ج.م',
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? AppColor.kOrange
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
                Text(
                  extras[index]['name'],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? Colors.white
                        : Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

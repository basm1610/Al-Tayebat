import 'package:apppp/core/constant/app_color.dart';
import 'package:apppp/feature/foodDetails/presentation/widgets/BuildQtyButton.dart';
import 'package:flutter/material.dart';

class BuildQtyRow extends StatelessWidget {
  final int qty;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const BuildQtyRow({
    super.key,
    required this.qty,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColor.kInputBg,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              BuildQtyButton(
                icon: Icons.remove_rounded,
                onTap: onDecrement,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '$qty',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              BuildQtyButton(
                icon: Icons.add_rounded,
                onTap: onIncrement,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
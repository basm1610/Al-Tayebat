
import 'package:apppp/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class BuildCouponRow extends StatefulWidget {
    final ValueChanged<double> onDiscountChanged;

  const BuildCouponRow({super.key, required this.onDiscountChanged,});

  @override
  State<BuildCouponRow> createState() => _BuildCouponRowState();
}

class _BuildCouponRowState extends State<BuildCouponRow> {
  final _couponController = TextEditingController();
  bool applied = false; // عشان منطبقش الكوبون أكتر من مرة
 
  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }
 
  void applyCoupon() {
    // if (_applied) return; // الكوبون اتطبق قبل كده
 
    if (_couponController.text.trim().toUpperCase() == 'TAYBAT') {
      setState(() => applied = true);
 
      widget.onDiscountChanged(20);
 
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم تطبيق الكوبون ✓')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('كود الخصم غير صحيح')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'كود الخصم',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            // Apply button
            GestureDetector(
              onTap: applyCoupon,
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: applied ? AppColor.kOrange : AppColor.kInputBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'تطبيق',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Input
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: AppColor.kInputBg,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: applied
                        ? AppColor.kOrange.withOpacity(0.5)
                        : Colors.white.withOpacity(0.07)),
                ),
                child: TextField(
                  controller: _couponController,
                  // enabled: applied,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'أدخل رمز القسيمة',
                    hintTextDirection: TextDirection.rtl,
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.3),
                      fontSize: 13,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.confirmation_num_outlined,
                      color: Colors.white.withOpacity(0.3),
                      size: 18,
                    ),
                  ),
                  cursorColor: AppColor.kOrange,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

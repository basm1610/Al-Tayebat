// import 'package:apppp/core/constant/app_color.dart';
// import 'package:apppp/feature/cart/data/models/model.dart';
// import 'package:flutter/material.dart';

// class BuildPriceSummary extends StatefulWidget {
//   final List<CartItem> items;
//   final double deliveryFee;
//   final double discount;

//   const BuildPriceSummary({
//     super.key,
//     required this.items,
//     required this.deliveryFee,
//     required this.discount,
//   });

//   @override
//   State<BuildPriceSummary> createState() => _BuildPriceSummaryState();
// }

// class _BuildPriceSummaryState extends State<BuildPriceSummary> {
//   double get _subtotal => widget.items.fold(0, (sum, item) => sum + item.total);
//   double get _grandTotal => _subtotal + widget.deliveryFee - widget.discount;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: AppColor.kCard,
//         borderRadius: BorderRadius.circular(18),
//         border: Border.all(color: Colors.white.withOpacity(0.05)),
//       ),
//       child: Column(
//         children: [
//           _priceRow('المجموع الفرعي', _subtotal, color: Colors.white),
//           const SizedBox(height: 14),
//           _priceRow('رسوم التوصيل', widget.deliveryFee, color: Colors.white),
//           const SizedBox(height: 14),
//           _priceRow('الخصم', -widget.discount, color: AppColor.kOrange),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 14),
//             child: Divider(color: Colors.white.withOpacity(0.08), height: 1),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     ' ج.م',
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Colors.white.withOpacity(0.6),
//                     ),
//                   ),
//                   Text(
//                     _formatPrice(_grandTotal),
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.w900,
//                       color: AppColor.kOrange,
//                     ),
//                   ),
//                 ],
//               ),
//               const Text(
//                 'الإجمالي',
//                 textDirection: TextDirection.rtl,
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ✅ الميثود جوا الكلاس صح
//   Widget _priceRow(String label, double amount, {required Color color}) {
//     final isNegative = amount < 0;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Text(
//               ' ج.م',
//               style: TextStyle(fontSize: 12, color: color.withOpacity(0.7)),
//             ),
//             Text(
//               isNegative
//                   ? '-${_formatPrice(amount.abs())}'
//                   : _formatPrice(amount),
//               style: TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w600,
//                 color: color,
//               ),
//             ),
//           ],
//         ),
//         Text(
//           label,
//           textDirection: TextDirection.rtl,
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.white.withOpacity(0.65),
//           ),
//         ),
//       ],
//     );
//   }

//   String _formatPrice(double v) {
//     final formatted = v.toStringAsFixed(2);
//     // مثلاً: 130.00 يبقى 130.00
//     return formatted;
//   }
// }
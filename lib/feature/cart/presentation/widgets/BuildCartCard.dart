// import 'package:apppp/core/constant/app_color.dart';
// import 'package:apppp/feature/cart/data/models/model.dart';
// import 'package:apppp/feature/cart/presentation/widgets/BuildSmallQtyButton.dart';
// import 'package:flutter/material.dart';

// class BuildCartCard extends StatefulWidget {
//   final CartItem item;
//     final VoidCallback onQtyChanged;


//   const BuildCartCard({super.key, required this.item, required this.onQtyChanged});

//   @override
//   State<BuildCartCard> createState() => _BuildCartCardState();
// }

// class _BuildCartCardState extends State<BuildCartCard> {
//    void _increment() {
//     setState(() => widget.item.qty++);
//     widget.onQtyChanged(); 
//   }
 
//   void _decrement() {
//     if (widget.item.qty > 1) {
//       setState(() => widget.item.qty--);
//       widget.onQtyChanged(); 
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 14),
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: AppColor.kCard,
//           borderRadius: BorderRadius.circular(18),
//           border: Border.all(color: Colors.white.withOpacity(0.05)),
//         ),
//         child: Row(
//           children: [
//             // Delete icon
//             GestureDetector(
//               onTap: (){},
//               child: Container(
//                 width: 34,
//                 height: 34,
//                 decoration: BoxDecoration(
//                   color: AppColor.kInputBg,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Icon(
//                   Icons.delete_outline_rounded,
//                   color: Colors.white.withOpacity(0.5),
//                   size: 18,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 10),
//             // Info
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     widget.item.name,
//                     textDirection: TextDirection.rtl,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 3),
//                   Text(
//                     widget.item.subtitle,
//                     textDirection: TextDirection.rtl,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.white.withOpacity(0.5),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   // Qty + price
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Qty stepper
//                       Container(
//                         height: 36,
//                         decoration: BoxDecoration(
//                           color: AppColor.kInputBg,
//                           borderRadius: BorderRadius.circular(18),
//                         ),
//                         child: Row(
//                           children: [
//                             BuildSmallQtyButton(
//                               icon: Icons.add_rounded,
//                               onTap: _increment,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 10,
//                               ),
//                               child: Text(
//                                 '${widget.item.qty}',
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             BuildSmallQtyButton(
//                               icon: Icons.remove_rounded,
//                               onTap: _decrement,
//                             ),
//                           ],
//                         ),
//                       ),
//                       // Price
//                       Row(
//                         children: [
//                           Text(
//                             ' ج.م',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.white.withOpacity(0.5),
//                             ),
//                           ),
//                           Text(
//                             _formatPrice(widget.item.total),
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w800,
//                               color: AppColor.kOrange,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 12),
//             // Food image
//             ClipRRect(
//               borderRadius: BorderRadius.circular(14),
//               child: SizedBox(
//                 width: 72,
//                 height: 72,
//                 child: Image.network(
//                   widget.item.imageUrl,
//                   fit: BoxFit.cover,
//                   errorBuilder: (_, __, ___) =>
//                       Container(color: const Color(0xFF2A2A2A)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String _formatPrice(double v) {
//     return v.toStringAsFixed(2).replaceAll(RegExp(r'\.?0+$'), '') +
//         (v.toStringAsFixed(2).contains('.') ? '.00' : '');
//   }
// }

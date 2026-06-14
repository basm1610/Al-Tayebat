import 'package:apppp/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class BuildHeroImage extends StatelessWidget {
  const BuildHeroImage({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=600',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                Container(color: const Color(0xFF2A2A2A)),
          ),
          // Gradient overlay bottom
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color(0xFF111111).withOpacity(0.95),
                  ],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),
          ),
          // Name + price overlay
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Rating
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColor.kOrange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Text('4.8',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      SizedBox(width: 4),
                      Icon(Icons.star_rounded, color: Colors.white, size: 14),
                    ],
                  ),
                ),
                // Name + price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('زينجر حار',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                    Row(
                      children: [
                        Text(' ج.م',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withOpacity(0.7))),
                        const Text('130',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: AppColor.kOrange)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
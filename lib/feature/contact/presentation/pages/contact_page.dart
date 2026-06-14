import 'package:apppp/core/constant/app_color.dart';
import 'package:apppp/feature/auth/presentation/widgets/login_widgets/BuildSocialButtons.dart';
import 'package:apppp/feature/contact/presentation/widgets/BuildAddressCard.dart';
import 'package:apppp/feature/contact/presentation/widgets/BuildPhoneCard.dart';
import 'package:apppp/feature/contact/presentation/widgets/BuildRestaurantHeroSection.dart';
import 'package:apppp/feature/foodDetails/presentation/widgets/BuildTopButtonBar.dart';
// import 'package:apppp/feature/home%20copy/presentation/pages/contact_page.dart';
import 'package:flutter/material.dart';

import '../../../cart/presentation/widgets/BuildTopBarCart.dart';



// ─────────────────────────────────────────
// FEATURE: MAP SECTION
// ─────────────────────────────────────────
class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'موقعنا على الخريطة',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color(0xFFE8E8E8),
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                // Map placeholder
                Stack(
                  children: [
                    Container(
                      height: 180,
                      color: const Color(0xFFD8D8D8),
                      child: Image.network(
                        'https://maps.googleapis.com/maps/api/staticmap?center=24.7136,46.6753&zoom=14&size=600x300&maptype=roadmap&style=element:geometry|color:0xf5f5f5&style=element:labels.icon|visibility:off&style=element:labels.text.fill|color:0x616161&key=YOUR_KEY',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (_, __, ___) => _MapPlaceholder(),
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 70),
                        child: Icon(
                          Icons.location_on,
                          color: Color(0xFFE07B2A),
                          size: 42,
                        ),
                      ),
                    ),
                  ],
                ),

                // Call Now button
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    color: const Color(0xFFE07B2A),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(Icons.phone, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'اتصل الآن',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Open in Maps button
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    color: Colors.white,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(
                          Icons.map_outlined,
                          color: Color(0xFFE07B2A),
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'فتح في الخرائط',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Color(0xFFE07B2A),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MapPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: const Color(0xFFDDDDDD),
      child: CustomPaint(
        painter: _GridPainter(),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFCCCCCC)
      ..strokeWidth = 1;

    for (double x = 0; x <= size.width; x += 30) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += 30) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    final roadPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6;
    canvas.drawLine(const Offset(0, 90), Offset(size.width, 90), roadPaint);
    canvas.drawLine(
      Offset(size.width * 0.5, 0),
      Offset(size.width * 0.5, size.height),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.25, 0),
      Offset(size.width * 0.25, size.height),
      roadPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─────────────────────────────────────────
// FEATURE: BOTTOM NAVIGATION BAR
// ─────────────────────────────────────────

// ─────────────────────────────────────────
// SCREEN: CONTACT US (تواصل معنا)
// ─────────────────────────────────────────
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      // appBar: const ContactAppBar(), // ← Feature: AppBar
      // bottomNavigationBar: const ContactBottomNav(), // ← Feature: BottomNav
      body: SafeArea(
        child: Column(
          children: [
            BuildTopBarCart(context: context, text: 'تواصل معنا'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const BuildRestaurantHeroSection(), // ← Feature: Hero image + name
                    const SizedBox(height: 8),
                    const BuildAddressCard(), // ← Feature: Address info
                    const BuildPhoneCard(), // ← Feature: Phone info
                    // SocialMediaRow(), // ← Feature: Social icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildSocialButtons(onTap: () {}, isApple: true),
                        const SizedBox(width: 16),
                        BuildSocialButtons(
                          onTap: () {},
                          icon: Icons.facebook,
                          color: AppColor.kOrange,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    const MapSection(), // ← Feature: Map + action buttons
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

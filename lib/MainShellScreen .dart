import 'package:apppp/feature/cart/presentation/pages/cartPage.dart';
import 'package:apppp/feature/contact/presentation/pages/contact_page.dart';
import 'package:apppp/feature/home/presentation/pages/home_page.dart';
import 'package:apppp/feature/my_orders/presentation/pages/my_orders_screen.dart';
import 'package:flutter/material.dart';

class MainShellScreen extends StatefulWidget {
  const MainShellScreen({super.key});

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  static const kOrange = Color(0xFFFF6A00);

  int _currentIndex = 3;
  final List<Widget> _screens = [
    const ContactScreen(), // index 0 → الملف
    MyOrdersScreen(), // index 1 → الطلبات
    const CartScreen(), // index 2 → السلة
    const HomeScreen(), // index 3 → الرئيسية
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      // ✅ IndexedStack يحافظ على state كل screen
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    const items = [
      (Icons.person_outline_rounded, 'الملف'),
      (Icons.receipt_long_outlined, 'الطلبات'),
      (Icons.shopping_cart_outlined, 'السلة'),
      (Icons.home_rounded, 'الرئيسية'),
    ];

    return Container(
      height: MediaQuery.of(context).size.height * .08,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.06))),
      ),
      child: Row(
        children: List.generate(items.length, (i) {
          final selected = i == _currentIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _currentIndex = i),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ✅ indicator فوق الأيقونة المحددة
                  Icon(
                    items[i].$1,
                    color: selected ? kOrange : Colors.white.withOpacity(0.4),
                    size: 24,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    items[i].$2,
                    style: TextStyle(
                      fontSize: 11,
                      color: selected ? kOrange : Colors.white.withOpacity(0.4),
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: selected ? 24 : 0,
                    height: 3,
                    margin: const EdgeInsets.only(bottom: 6),
                    decoration: BoxDecoration(
                      color: kOrange,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

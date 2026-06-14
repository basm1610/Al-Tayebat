import 'package:apppp/feature/all_menu/data/datasources/app_data.dart';
import 'package:apppp/feature/cart/presentation/widgets/BuildTopBarCart.dart';
import 'package:apppp/feature/my_orders/data/models/model.dart';
import 'package:apppp/feature/my_orders/presentation/widgets/MyOrderCard.dart';
import 'package:apppp/feature/my_orders/presentation/widgets/OrderFilterBar.dart';
import 'package:apppp/feature/my_orders/presentation/widgets/SuggestionBanner.dart';
import 'package:flutter/material.dart';

// ─────────────────────────────────────────
// DATA MODELS
// ─────────────────────────────────────────




// ─────────────────────────────────────────
// MOCK DATA
// ─────────────────────────────────────────


// ─────────────────────────────────────────
// SCREEN 2: ORDERS (طلباتي)
// ─────────────────────────────────────────
class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = [
    'الكل',
    'جاري التنفيذ',
    'تم التوصيل',
    'الملغاة',
  ];

  List<OrderItem> get _filteredOrders {
    if (_selectedFilter == 0) return AppData.orders;
    final statusMap = {
      1: OrderStatus.preparing,
      2: OrderStatus.delivered,
      3: OrderStatus.cancelled,
    };
    return AppData.orders
        .where((o) => o.status == statusMap[_selectedFilter])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      body: SafeArea(
        child: Column(
          children: [
            BuildTopBarCart(context: context, text: 'طلباتي'),
           OrderFilterBar(
            filters: _filters,
            selectedIndex: _selectedFilter,
            onFilterSelected: (i) => setState(() => _selectedFilter = i),
          ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                children: [
                  ..._filteredOrders.map((o) => OrderCard(order: o)),
                  if (_filteredOrders.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 60),
                        child: Text(
                          'لا توجد طلبات',
                          style: TextStyle(
                            color: Colors.white38,
                            fontFamily: 'Cairo',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  // Suggestion banner
                  if (_selectedFilter == 0) const SuggestionBanner(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


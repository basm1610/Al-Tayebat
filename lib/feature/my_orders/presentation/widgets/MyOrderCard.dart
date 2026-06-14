import 'package:apppp/feature/my_orders/data/models/model.dart';
import 'package:apppp/feature/my_orders/presentation/widgets/StatusBadge.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final OrderItem order;

  const OrderCard({super.key, required this.order});

  String get _statusLabel {
    switch (order.status) {
      case OrderStatus.preparing:
        return 'جاري التحضير';
      case OrderStatus.delivering:
        return 'جاري التوصيل';
      case OrderStatus.delivered:
        return 'تم التوصيل';
      case OrderStatus.cancelled:
        return 'ملغي';
    }
  }

  Color get _statusColor {
    switch (order.status) {
      case OrderStatus.preparing:
        return const Color(0xFFE07B2A);
      case OrderStatus.delivering:
        return const Color(0xFF3B82F6);
      case OrderStatus.delivered:
        return const Color(0xFF22C55E);
      case OrderStatus.cancelled:
        return Colors.red;
    }
  }

  bool get _isDelivered =>
      order.status == OrderStatus.delivered ||
      order.status == OrderStatus.cancelled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(18),
        border: order.status == OrderStatus.preparing
            ? Border.all(
                color: const Color(0xFFE07B2A).withOpacity(0.3),
                width: 1,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Header: status + order number
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusBadge(
                label: _statusLabel,
                color: _statusColor,
                isPreparing: order.status == OrderStatus.preparing,
              ),
              Text(
                order.orderNumber,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 12,
                  fontFamily: 'Cairo',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Title
          Text(
            order.title,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            order.date,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.white.withOpacity(0.45),
              fontSize: 12,
              fontFamily: 'Cairo',
            ),
          ),

          if (order.items.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...order.items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  item,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 13,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
            ),
          ],

          const SizedBox(height: 12),
          const Divider(color: Color(0xFF2A2A2A), height: 1),
          const SizedBox(height: 12),

          // Total + action button
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'الإجمالي',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.45),
                      fontSize: 11,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  Text(
                    '${order.total.toStringAsFixed(2)} ج.م',
                    style: const TextStyle(
                      color: Color(0xFFE07B2A),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: _isDelivered
                        ? Colors.transparent
                        : const Color(0xFFE07B2A),
                    borderRadius: BorderRadius.circular(12),
                    border: _isDelivered
                        ? Border.all(color: const Color(0xFFE07B2A), width: 1.5)
                        : null,
                  ),
                  child: Text(
                    _isDelivered ? 'إعادة الطلب' : 'تتبع الطلب',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: _isDelivered
                          ? const Color(0xFFE07B2A)
                          : Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

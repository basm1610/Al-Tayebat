class OrderItem {
  final String orderNumber;
  final String title;
  final String date;
  final List<String> items;
  final double total;
  final OrderStatus status;

  const OrderItem({
    required this.orderNumber,
    required this.title,
    required this.date,
    required this.items,
    required this.total,
    required this.status,
  });
}
enum OrderStatus { preparing, delivering, delivered, cancelled }

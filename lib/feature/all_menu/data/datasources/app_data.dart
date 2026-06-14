import 'package:apppp/feature/all_menu/data/models/model.dart';
import 'package:apppp/feature/my_orders/data/models/model.dart';

class AppData {
  static const List<String> menuCategories = [
    'ساندوتشات',
    'وجبات',
    'بطاطس',
    'مشويات',
    'مشروبات',
  ];

  static const Map<String, List<MenuItem>> menuByCategory = {
    'ساندوتشات': [
      MenuItem(
        name: 'كريسبي سوبريم',
        description:
            'صدر دجاج مقرمش مع جبنة شيدر سائلة، خس طازج وصوص الطيبات الخاص.',
        price: 45,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600',
        prepTime: '١٠-١٥ دقيقة',
        category: 'ساندوتشات',
      ),
      MenuItem(
        name: 'رويال بيف',
        description:
            'شريحتين من اللحم المشوي، بصل مكرمل، وجبنة مدخنة في خبز البريوش.',
        price: 55,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1553979459-d2229ba7433b?w=600',
        prepTime: '٢٠-٢٥ دقيقة',
        category: 'ساندوتشات',
      ),
      MenuItem(
        name: 'برجر الدجاج الحار',
        description: 'دجاج مقرمش بالتوابل الحارة مع صوص الرانش وخيار مخلل.',
        price: 40,
        rating: 4.6,
        imageUrl:
            'https://images.unsplash.com/photo-1571091718767-18b5b1457add?w=600',
        prepTime: '١٠-١٥ دقيقة',
        category: 'ساندوتشات',
      ),
    ],
    'وجبات': [
      MenuItem(
        name: 'شرائح الاسترِبس',
        description:
            '٥ قطع من الدجاج المقرمش بتتبيلة الطيبات السرية مع صوص جاني.',
        price: 38,
        rating: 4.7,
        imageUrl:
            'https://images.unsplash.com/photo-1562967914-608f82629710?w=600',
        prepTime: '١٠-١٥ دقيقة',
        category: 'وجبات',
      ),
      MenuItem(
        name: 'أجنحة بافلو',
        description:
            '٨ أجنحة دجاج مغطاة بصوص الباقلو الحار والزبدة، تقدم مع صوص الرانش.',
        price: 32,
        rating: 4.6,
        imageUrl:
            'https://images.unsplash.com/photo-1567620832903-9fc6debc209f?w=600',
        prepTime: '١٥ دقيقة',
        category: 'وجبات',
      ),
      MenuItem(
        name: 'وجبة الكومبو الكبير',
        description: 'برجر + بطاطس مقلية + مشروب غازي بحجمك المفضل.',
        price: 65,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?w=600',
        prepTime: '١٥-٢٠ دقيقة',
        category: 'وجبات',
      ),
    ],
    'بطاطس': [
      MenuItem(
        name: 'بطاطس مقرمشة',
        description: 'بطاطس طازجة مقلية بزيت نباتي نقي مع ملح خشن.',
        price: 15,
        rating: 4.5,
        imageUrl:
            'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=600',
        prepTime: '٥-١٠ دقائق',
        category: 'بطاطس',
      ),
      MenuItem(
        name: 'بطاطس بالجبنة',
        description: 'بطاطس محمصة مع جبنة شيدر مذابة وبهارات مميزة.',
        price: 22,
        rating: 4.7,
        imageUrl:
            'https://images.unsplash.com/photo-1530469912745-a215c6b256ea?w=600',
        prepTime: '١٠ دقائق',
        category: 'بطاطس',
      ),
    ],
    'مشويات': [
      MenuItem(
        name: 'مشويات الطيبات المختلطة',
        description: 'صحن مشويات مشكل كبير مع مقبلات مشكلة.',
        price: 85,
        rating: 4.9,
        imageUrl:
            'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=600',
        prepTime: '٢٥-٣٠ دقيقة',
        category: 'مشويات',
      ),
      MenuItem(
        name: 'شيش طاووق',
        description: 'قطع دجاج متبلة على الفحم مع خبز تنور وثوم.',
        price: 45,
        rating: 4.8,
        imageUrl:
            'https://images.unsplash.com/photo-1599487488170-d11ec9c172f0?w=600',
        prepTime: '٢٠ دقيقة',
        category: 'مشويات',
      ),
    ],
    'مشروبات': [
      MenuItem(
        name: 'عصير مانجو طازج',
        description: 'عصير مانجو طبيعي ١٠٠٪ بدون إضافات.',
        price: 18,
        rating: 4.6,
        imageUrl:
            'https://images.unsplash.com/photo-1546173159-315724a31696?w=600',
        prepTime: '٥ دقائق',
        category: 'مشروبات',
      ),
      MenuItem(
        name: 'كولا حجم عائلي',
        description: 'مشروب غازي بارد بالحجم الكبير.',
        price: 12,
        rating: 4.4,
        imageUrl:
            'https://images.unsplash.com/photo-1581636625402-29b2a704ef13?w=600',
        prepTime: 'فوري',
        category: 'مشروبات',
      ),
    ],
  };

  static const List<OrderItem> orders = [
    OrderItem(
      orderNumber: '#88241',
      title: 'وجبة كريسبي عائلية',
      date: 'اليوم، 08:30 مساءً',
      items: ['2x وجبة كريسبي حار', '1x كولا حجم عائلي'],
      total: 145.00,
      status: OrderStatus.preparing,
    ),
    OrderItem(
      orderNumber: '#87120',
      title: 'مشويات الطيبات المختلطة',
      date: 'أمس، 02:15 مساءً',
      items: ['1x صحن مشويات مشكل (كبير)', '3x مقبلات مشكلة'],
      total: 210.50,
      status: OrderStatus.delivered,
    ),
    OrderItem(
      orderNumber: '#86004',
      title: 'عرض نهاية الأسبوع',
      date: '15 أكتوبر، 09:00 مساءً',
      items: [],
      total: 89.00,
      status: OrderStatus.delivered,
    ),
  ];
}
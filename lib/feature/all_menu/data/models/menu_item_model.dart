import 'package:apppp/feature/all_menu/data/models/item_size_model.dart';

class MenuItemModel {
  final int id;
  final String name;
  final List<ItemSizeModel> sizes;
 
  const MenuItemModel({
    required this.id,
    required this.name,
    required this.sizes,
  });
 
  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      id: json['id'] as int,
      name: json['name'] as String,
      sizes: (json['sizes'] as List<dynamic>)
          .map((s) => ItemSizeModel.fromJson(s as Map<String, dynamic>))
          .toList(),
    );
  }
 
  /// أقل سعر من الأحجام المتاحة — للعرض في الكارد
  int get startingPrice => sizes.isEmpty ? 0 : sizes.first.price;
 
  /// إذا كان فيه حجم واحد فقط ما نعرضش selector
  bool get hasSingleSize => sizes.length == 1;
}
import 'package:apppp/feature/all_menu/data/models/menu_item_model.dart';

class MenuCategoryModel {
  final int id;
  final String name;
  final List<MenuItemModel> items;
 
  const MenuCategoryModel({
    required this.id,
    required this.name,
    required this.items,
  });
 
  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) {
    return MenuCategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      items: (json['items'] as List<dynamic>)
          .map((i) => MenuItemModel.fromJson(i as Map<String, dynamic>))
          .toList(),
    );
  }
}
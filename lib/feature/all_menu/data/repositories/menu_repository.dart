
import 'dart:convert';

import 'package:apppp/feature/all_menu/data/models/menu_category_model.dart';
import 'package:flutter/services.dart';

class MenuRepository {
  /// يقرأ ملف JSON من assets ويحوله لـ List<MenuCategoryModel>
  Future<List<MenuCategoryModel>> loadCategories() async {
    try {
      final jsonString = await rootBundle.loadString('assets/data/menu.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      final List<dynamic> categoriesJson = jsonMap['categories'] as List<dynamic>;

      return categoriesJson
          .map((c) => MenuCategoryModel.fromJson(c as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('فشل تحميل قائمة الطعام: $e');
    }
  }
}
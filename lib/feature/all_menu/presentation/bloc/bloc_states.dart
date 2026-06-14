
import '../../data/models/menu_category_model.dart';

abstract class MenuState {}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuLoaded extends MenuState {
  final List<MenuCategoryModel> categories;
  final int selectedCategoryIndex;

  MenuLoaded({
    required this.categories,
    this.selectedCategoryIndex = 0,
  });

  /// الفئة المحددة حالياً
  MenuCategoryModel get selectedCategory =>
      categories[selectedCategoryIndex];

  /// إنشاء نسخة جديدة مع تغيير الفئة المحددة فقط
  MenuLoaded copyWith({int? selectedCategoryIndex}) {
    return MenuLoaded(
      categories: categories,
      selectedCategoryIndex: selectedCategoryIndex ?? this.selectedCategoryIndex,
    );
  }
}

/// حدث خطأ أثناء التحميل
class MenuError extends MenuState {
  final String message;
  MenuError(this.message);
}
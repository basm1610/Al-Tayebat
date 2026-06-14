abstract class MenuEvent {}
 
/// يُطلق عند فتح الشاشة لأول مرة لتحميل البيانات
class LoadMenuEvent extends MenuEvent {}
 
/// يُطلق عند الضغط على فئة في التاب بار
class SelectCategoryEvent extends MenuEvent {
  final int categoryIndex;
  SelectCategoryEvent(this.categoryIndex);
}
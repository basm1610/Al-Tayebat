import 'package:apppp/feature/all_menu/data/repositories/menu_repository.dart';
import 'package:apppp/feature/all_menu/presentation/bloc/bloc_events.dart';
import 'package:apppp/feature/all_menu/presentation/bloc/bloc_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuRepository _repository;

  MenuBloc({required MenuRepository repository})
      : _repository = repository,
        super(MenuInitial()) {
    on<LoadMenuEvent>(_onLoadMenu);
    on<SelectCategoryEvent>(_onSelectCategory);
  }

  /// تحميل الداتا من JSON عند فتح الشاشة
  Future<void> _onLoadMenu(
    LoadMenuEvent event,
    Emitter<MenuState> emit,
  ) async {
    emit(MenuLoading());
    try {
      final categories = await _repository.loadCategories();
      emit(MenuLoaded(categories: categories));
    } catch (e) {
      emit(MenuError(e.toString()));
    }
  }

  /// تغيير الفئة المحددة — بدون إعادة تحميل الداتا
  void _onSelectCategory(
    SelectCategoryEvent event,
    Emitter<MenuState> emit,
  ) {
    final currentState = state;
    if (currentState is MenuLoaded) {
      emit(currentState.copyWith(selectedCategoryIndex: event.categoryIndex));
    }
  }
}
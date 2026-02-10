import 'package:admin_dashboard/features/categories/domain/usecases/get_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._getCategoriesUseCase)
      : super(const CategoriesInitial());

  final GetCategoriesUseCase _getCategoriesUseCase;

  Future<void> loadCategories() async {
    emit(const CategoriesLoading());
    try {
      final categories = await _getCategoriesUseCase();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError('Failed to load categories'));
    }
  }
}


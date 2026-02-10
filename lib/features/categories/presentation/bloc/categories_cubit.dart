import 'package:admin_dashboard/features/categories/domain/usecases/add_category_use_case.dart';
import 'package:admin_dashboard/features/categories/domain/usecases/get_categories_use_case.dart';
import 'package:admin_dashboard/core/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:admin_dashboard/features/categories/domain/entities/category.dart';
import 'package:admin_dashboard/features/categories/presentation/bloc/categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._getCategoriesUseCase)
    : super(const CategoriesInitial());

  final GetCategoriesUseCase _getCategoriesUseCase;

  Future<void> loadCategories() async {
    emit(const CategoriesLoading());
    final result = await _getCategoriesUseCase();
    result.fold(
      (failure) => emit(CategoriesError(failure.message)),
      (categories) => emit(CategoriesLoaded(categories)),
    );
  }

  Future<void> addCategory(Category category) async {
    emit(const CategoriesAdding());
    final addCategoryUseCase = sl<AddCategoryUseCase>();
    final result = await addCategoryUseCase(category);
    result.fold((failure) => emit(CategoriesError(failure.message)), (_) {
      emit(const CategoriesAdded());
      loadCategories();
    });
  }
}

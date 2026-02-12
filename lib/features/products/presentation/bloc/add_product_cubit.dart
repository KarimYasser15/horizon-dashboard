import 'package:admin_dashboard/features/products/domain/usecases/update_product_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/add_product_use_case.dart';
import 'add_product_state.dart';

@injectable
class AddProductCubit extends Cubit<AddProductState> {
  final AddProductUseCase _addProductUseCase;
  final UpdateProductUseCase _updateProductUseCase;

  AddProductCubit(this._addProductUseCase, this._updateProductUseCase)
    : super(const AddProductInitial());

  Future<void> addProduct(Product product) async {
    emit(const AddProductLoading());
    final result = await _addProductUseCase(product);
    result.fold(
      (failure) => emit(AddProductError(failure.message)),
      (_) => emit(const AddProductSuccess()),
    );
  }

  Future<void> updateProduct(Product product) async {
    emit(const AddProductLoading());
    final result = await _updateProductUseCase(product);
    result.fold(
      (failure) => emit(AddProductError(failure.message)),
      (_) => emit(const AddProductSuccess()),
    );
  }
}

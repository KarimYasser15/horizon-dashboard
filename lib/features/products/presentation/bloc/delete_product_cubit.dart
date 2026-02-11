import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/delete_product_use_case.dart';

@injectable
class DeleteProductCubit extends Cubit<void> {
  final DeleteProductUseCase _deleteProductUseCase;

  DeleteProductCubit(this._deleteProductUseCase) : super(null);

  Future<void> deleteProduct(String productId) async {
    final result = await _deleteProductUseCase(productId);
    result.fold((failure) => null, (_) => null);
  }
}

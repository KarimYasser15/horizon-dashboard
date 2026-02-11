import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<void> addProduct(ProductModel product);
}

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final FirebaseFirestore firestore;

  ProductRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<ProductModel>> getProducts() async {
    final snapshot = await firestore.collection('products').get();
    return snapshot.docs
        .map((doc) => ProductModel.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }

  @override
  Future<void> addProduct(ProductModel product) async {
    await firestore
        .collection('products')
        .add(product.toJson());
  }
}

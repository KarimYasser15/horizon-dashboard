import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:admin_dashboard/features/categories/data/models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<void> addCategory(CategoryModel category);
  Future<void> updateCategory(CategoryModel category);
  Future<void> deleteCategory(String id);
}

@LazySingleton(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final FirebaseFirestore firestore;

  CategoryRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await firestore.collection('categories').get();
    return snapshot.docs
        .map((doc) => CategoryModel.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }

  @override
  Future<void> addCategory(CategoryModel category) async {
    await firestore
        .collection('categories')
        .doc(category.id)
        .set(category.toJson());
  }

  @override
  Future<void> updateCategory(CategoryModel category) async {
    await firestore
        .collection('categories')
        .doc(category.id)
        .update(category.toJson());
  }

  @override
  Future<void> deleteCategory(String id) async {
    await firestore.collection('categories').doc(id).delete();
  }
}

import 'package:admin_dashboard/config/app_theme.dart';
import 'package:admin_dashboard/core/shell/main_screen.dart';
import 'package:admin_dashboard/features/categories/presentation/bloc/categories_cubit.dart';
import 'package:admin_dashboard/features/products/presentation/bloc/products_cubit.dart';
import 'package:admin_dashboard/features/products/presentation/bloc/delete_product_cubit.dart';
import 'package:admin_dashboard/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<CategoriesCubit>()..loadCategories()),
        BlocProvider(create: (_) => di.sl<ProductsCubit>()..loadProducts()),
        BlocProvider(create: (_) => di.sl<DeleteProductCubit>()),
      ],
      child: MaterialApp(
        title: 'Admin Dashboard',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const MainScreen(),
      ),
    );
  }
}

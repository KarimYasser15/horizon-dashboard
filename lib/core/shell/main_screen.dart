import 'package:admin_dashboard/config/routes_manager.dart';
import 'package:admin_dashboard/core/widgets/main_shell.dart';
import 'package:admin_dashboard/features/categories/presentation/pages/categories_page.dart';
import 'package:admin_dashboard/features/products/presentation/pages/products_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.initialRoute = AppRoute.products});

  final AppRoute initialRoute;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late AppRoute _selectedRoute;

  @override
  void initState() {
    super.initState();
    _selectedRoute = enabledRoutes.contains(widget.initialRoute)
        ? widget.initialRoute
        : AppRoute.products;
  }

  Widget _buildContent() {
    switch (_selectedRoute) {
      case AppRoute.dashboard:
      case AppRoute.orders:
      case AppRoute.customers:
      case AppRoute.general:
      case AppRoute.security:
        return const _DisabledPage();
      case AppRoute.products:
        return const ProductsPage();
      case AppRoute.categories:
        return const CategoriesPage();
    }
  }

  Widget? _buildFab() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MainShell(
      selectedRoute: _selectedRoute,
      onRouteChanged: (route) {
        if (enabledRoutes.contains(route)) {
          setState(() => _selectedRoute = route);
        }
      },
      content: _buildContent(),
      floatingActionButton: _buildFab(),
    );
  }
}

class _DisabledPage extends StatelessWidget {
  const _DisabledPage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'This page is currently disabled.',
        style: TextStyle(color: Colors.grey, fontSize: 16),
      ),
    );
  }
}

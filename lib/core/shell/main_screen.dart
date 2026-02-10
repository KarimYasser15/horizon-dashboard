import 'package:admin_dashboard/config/routes_manager.dart';
import 'package:admin_dashboard/core/widgets/main_shell.dart';
import 'package:admin_dashboard/features/categories/presentation/pages/categories_page.dart';
import 'package:admin_dashboard/features/customers/presentation/pages/customers_page.dart';
import 'package:admin_dashboard/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:admin_dashboard/features/orders/presentation/pages/orders_page.dart';
import 'package:admin_dashboard/features/products/presentation/pages/products_page.dart';
import 'package:admin_dashboard/features/settings/presentation/pages/general_page.dart';
import 'package:admin_dashboard/features/settings/presentation/pages/security_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.initialRoute = AppRoute.dashboard});

  final AppRoute initialRoute;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late AppRoute _selectedRoute;

  @override
  void initState() {
    super.initState();
    _selectedRoute = widget.initialRoute;
  }

  Widget _buildContent() {
    switch (_selectedRoute) {
      case AppRoute.dashboard:
        return const DashboardPage();
      case AppRoute.products:
        return const ProductsPage();
      case AppRoute.categories:
        return const CategoriesPage();
      case AppRoute.orders:
        return const OrdersPage();
      case AppRoute.customers:
        return const CustomersPage();
      case AppRoute.general:
        return const GeneralPage();
      case AppRoute.security:
        return const SecurityPage();
    }
  }

  Widget? _buildFab() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MainShell(
      selectedRoute: _selectedRoute,
      onRouteChanged: (route) => setState(() => _selectedRoute = route),
      content: _buildContent(),
      floatingActionButton: _buildFab(),
    );
  }
}

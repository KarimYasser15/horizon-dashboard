import 'package:admin_dashboard/config/assets_manager.dart';

enum AppRoute {
  dashboard,
  products,
  categories,
  orders,
  customers,
  general,
  security,
}

extension AppRouteX on AppRoute {
  String get label => switch (this) {
    AppRoute.dashboard => 'Dashboard',
    AppRoute.products => 'Products',
    AppRoute.categories => 'Categories',
    AppRoute.orders => 'Orders',
    AppRoute.customers => 'Customers',
    AppRoute.general => 'General',
    AppRoute.security => 'Security',
  };

  String get icon => switch (this) {
    AppRoute.dashboard => IconsManager.dashboard,
    AppRoute.products => IconsManager.products,
    AppRoute.categories => IconsManager.categories,
    AppRoute.orders => IconsManager.orders,
    AppRoute.customers => IconsManager.customers,
    AppRoute.general => IconsManager.settings,
    AppRoute.security => IconsManager.security,
  };
}

class NavSection {
  const NavSection({required this.routes});
  final List<AppRoute> routes;
}

const List<NavSection> navSections = [
  NavSection(
    routes: [
      AppRoute.dashboard,
      AppRoute.products,
      AppRoute.categories,
      AppRoute.orders,
      AppRoute.customers,
    ],
  ),
  NavSection(routes: [AppRoute.general, AppRoute.security]),
];

const Set<AppRoute> enabledRoutes = {
  AppRoute.products,
  AppRoute.categories,
};

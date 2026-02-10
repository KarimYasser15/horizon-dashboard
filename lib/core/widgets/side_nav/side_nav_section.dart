import 'package:admin_dashboard/config/routes_manager.dart';
import 'package:admin_dashboard/core/widgets/side_nav/side_nav_item.dart';
import 'package:flutter/material.dart';

class SideNavSection extends StatelessWidget {
  const SideNavSection({
    super.key,
    required this.routes,
    required this.selectedRoute,
    required this.onNavigate,
    required this.compact,
  });

  final List<AppRoute> routes;
  final AppRoute selectedRoute;
  final ValueChanged<AppRoute> onNavigate;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: compact ? 8 : 24),
      child: Column(
        crossAxisAlignment: compact
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          for (final route in routes)
            SideNavItem(
              route: route,
              selected: selectedRoute == route,
              onTap: () => onNavigate(route),
              compact: compact,
            ),
        ],
      ),
    );
  }
}

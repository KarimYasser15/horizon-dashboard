import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:admin_dashboard/config/routes_manager.dart';
import 'package:admin_dashboard/core/widgets/side_nav/side_nav_footer.dart';
import 'package:admin_dashboard/core/widgets/side_nav/side_nav_header.dart';
import 'package:admin_dashboard/core/widgets/side_nav/side_nav_section.dart';
import 'package:flutter/material.dart';

class SideNav extends StatelessWidget {
  const SideNav({
    super.key,
    required this.selectedRoute,
    required this.onNavigate,
  });

  final AppRoute selectedRoute;
  final ValueChanged<AppRoute> onNavigate;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 220;

        return Container(
          width: isCompact ? 72 : 240,
          color: ColorsManager.lightGrey,
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: isCompact
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              SideNavHeader(compact: isCompact),
              const SizedBox(height: 32),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (final section in navSections) ...[
                        SideNavSection(
                          routes: section.routes,
                          selectedRoute: selectedRoute,
                          onNavigate: onNavigate,
                          compact: isCompact,
                        ),
                        const SizedBox(height: 4),
                      ],
                    ],
                  ),
                ),
              ),
              SideNavFooter(compact: isCompact),
            ],
          ),
        );
      },
    );
  }
}

import 'package:admin_dashboard/config/routes_manager.dart';
import 'package:flutter/material.dart';
import 'side_nav.dart';

class MainShell extends StatefulWidget {
  const MainShell({
    super.key,
    required this.selectedRoute,
    required this.onRouteChanged,
    required this.content,
    this.floatingActionButton,
  });

  final AppRoute selectedRoute;
  final ValueChanged<AppRoute> onRouteChanged;
  final Widget content;
  final Widget? floatingActionButton;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        return Scaffold(
          key: _scaffoldKey,
          appBar: isMobile
              ? AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black87),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                )
              : null,
          drawer: isMobile
              ? Drawer(
                  child: SideNav(
                    selectedRoute: widget.selectedRoute,
                    onNavigate: (route) {
                      widget.onRouteChanged(route);
                      Navigator.pop(context);
                    },
                  ),
                )
              : null,
          body: SafeArea(
            child: Row(
              children: [
                if (!isMobile) ...[
                  SideNav(
                    selectedRoute: widget.selectedRoute,
                    onNavigate: widget.onRouteChanged,
                  ),
                  const VerticalDivider(width: 1),
                ],
                Expanded(child: widget.content),
              ],
            ),
          ),
          floatingActionButton: widget.floatingActionButton,
        );
      },
    );
  }
}

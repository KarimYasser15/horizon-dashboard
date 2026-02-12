import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:admin_dashboard/config/routes_manager.dart';
import 'package:admin_dashboard/config/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideNavItem extends StatelessWidget {
  const SideNavItem({
    super.key,
    required this.route,
    required this.selected,
    required this.onTap,
    required this.compact,
  });

  final AppRoute route;
  final bool selected;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final foreground = selected ? ColorsManager.black : ColorsManager.grey;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: selected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 0 : 12,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: compact
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                route.icon,
                colorFilter: ColorFilter.mode(foreground, BlendMode.srcIn),
              ),
              if (!compact) ...[
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    route.label,
                    style: TextStyleManager.interMedium.copyWith(
                      color: foreground,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

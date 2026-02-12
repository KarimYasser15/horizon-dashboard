import 'package:admin_dashboard/config/assets_manager.dart';
import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:admin_dashboard/config/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideNavHeader extends StatelessWidget {
  const SideNavHeader({super.key, required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: compact ? 0 : 24),
      child: Row(
        mainAxisAlignment:
            compact ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: ColorsManager.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              IconsManager.appLogo,
              fit: BoxFit.scaleDown,
            ),
          ),
          if (!compact) ...[
            const SizedBox(width: 12),
            Text('Inventra', style: TextStyleManager.interBold),
          ],
        ],
      ),
    );
  }
}

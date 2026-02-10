import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:admin_dashboard/config/text_style_manager.dart';
import 'package:flutter/material.dart';

class SideNavFooter extends StatelessWidget {
  const SideNavFooter({super.key, required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: ColorsManager.grey,
          endIndent: 24,
          indent: 24,
          height: 1,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 16 : 20,
            vertical: 16,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: const Color(0xFF374151),
                child: const Text(
                  'SM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (!compact) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Sarah Miller',
                        style: TextStyleManager.interMedium.copyWith(
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'sarah@example.com',
                        style: TextStyleManager.interRegular,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

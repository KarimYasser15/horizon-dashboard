import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:admin_dashboard/config/text_style_manager.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.breadcrumbTrail,
    this.title,
    this.description,
    this.trailing,
    this.onBreadcrumbTap,
  });

  final List<String> breadcrumbTrail;
  final String? title;
  final String? description;
  final Widget? trailing;
  final void Function(int index)? onBreadcrumbTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: ColorsManager.lightGrey,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: _Breadcrumb(
                    trail: breadcrumbTrail,
                    onTap: onBreadcrumbTap,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none_rounded,
                      size: 22,
                      color: Colors.grey.shade600,
                    ),
                    style: IconButton.styleFrom(
                      foregroundColor: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.help_outline_rounded,
                      size: 22,
                      color: Colors.grey.shade600,
                    ),
                    style: IconButton.styleFrom(
                      foregroundColor: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (title != null || description != null || trailing != null)
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 600;

              return Padding(
                padding: EdgeInsets.fromLTRB(
                  isMobile ? 16 : 24,
                  20,
                  isMobile ? 16 : 24,
                  0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      Text(
                        title!,
                        style: TextStyleManager.interBold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (description != null || trailing != null) ...[
                      if (title != null) SizedBox(height: isMobile ? 8 : 4),
                      if (isMobile && trailing != null) ...[
                        if (description != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Text(
                              description!,
                              style: TextStyleManager.interRegular.copyWith(
                                color: ColorsManager.grey,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        trailing!,
                      ] else
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (description != null)
                              Expanded(
                                child: Text(
                                  description!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF6B7280),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            if (trailing != null) ...[
                              if (description != null)
                                const SizedBox(width: 16),
                              trailing!,
                            ],
                          ],
                        ),
                    ],
                  ],
                ),
              );
            },
          ),
      ],
    );
  }
}

class _Breadcrumb extends StatelessWidget {
  const _Breadcrumb({required this.trail, this.onTap});

  final List<String> trail;
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    if (trail.isEmpty) return const SizedBox.shrink();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < trail.length; i++) ...[
          if (i > 0) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                '>',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
            ),
          ],
          _BreadcrumbSegment(
            label: trail[i],
            isCurrent: i == trail.length - 1,
            onTap: onTap != null && i < trail.length - 1
                ? () => onTap!(i)
                : null,
          ),
        ],
      ],
    );
  }
}

class _BreadcrumbSegment extends StatelessWidget {
  const _BreadcrumbSegment({
    required this.label,
    required this.isCurrent,
    this.onTap,
  });

  final String label;
  final bool isCurrent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 14,
      color: isCurrent ? const Color(0xFF111827) : Colors.grey.shade600,
      fontWeight: isCurrent ? FontWeight.w600 : FontWeight.w400,
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: Text(
          label,
          style: style,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }
    return Text(
      label,
      style: style,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

import 'package:admin_dashboard/config/colors_manager.dart';
import 'package:admin_dashboard/core/widgets/section_card.dart';
import 'package:flutter/material.dart';

class StatusSection extends StatelessWidget {
  const StatusSection({super.key, required this.status, required this.onChanged});

  final String status;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Product Status',
      children: [
        _buildRadioTile('Active', status, onChanged),
        _buildRadioTile('Draft', status, onChanged),
      ],
    );
  }

  Widget _buildRadioTile(
      String value, String groupValue, ValueChanged<String?> onChanged) {
    return RadioListTile<String>(
      title: Text(value, style: const TextStyle(fontSize: 14)),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      contentPadding: EdgeInsets.zero,
      activeColor: ColorsManager.blue,
      visualDensity: VisualDensity.compact,
    );
  }
}

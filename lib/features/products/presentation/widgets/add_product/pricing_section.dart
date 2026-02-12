import 'package:admin_dashboard/core/widgets/section_card.dart';
import 'package:flutter/material.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({
    super.key,
    required this.basePriceController,
    required this.compareAtPriceController,
    required this.quantityController,
    required this.skuController,
    this.basePriceError,
    this.compareAtPriceError,
    this.quantityError,
  });

  final TextEditingController basePriceController;
  final TextEditingController compareAtPriceController;
  final TextEditingController quantityController;
  final TextEditingController skuController;
  final String? basePriceError;
  final String? compareAtPriceError;
  final String? quantityError;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Pricing & Inventory',
      children: [
        Row(
          children: [
            Expanded(
              child: LabeledField(
                label: 'Base Price',
                child: TextField(
                  controller: basePriceController,
                  decoration: AppInputDecoration(
                    hint: '\$ 0.00',
                    errorText: basePriceError,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: LabeledField(
                label: 'Compare at Price',
                child: TextField(
                  controller: compareAtPriceController,
                  decoration: AppInputDecoration(
                    hint: '\$ 0.00',
                    errorText: compareAtPriceError,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: LabeledField(
                label: 'Quantity',
                child: TextField(
                  controller: quantityController,
                  decoration: AppInputDecoration(
                    hint: '0',
                    errorText: quantityError,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: LabeledField(
                label: 'SKU (Stock Keeping Unit)',
                child: TextField(
                  controller: skuController,
                  decoration: AppInputDecoration(hint: 'e.g. HEAD-001'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

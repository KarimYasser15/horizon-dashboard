class Validators {
  static final _urlRegex = RegExp(
    r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
  );

  static final _slugRegex = RegExp(r'^[a-z0-9]+(?:-[a-z0-9]+)*$');

  static String? required(String? value, {String fieldName = 'This field'}) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? url(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) return null;
    if (!_urlRegex.hasMatch(trimmed)) {
      return 'Please enter a valid URL';
    }
    return null;
  }

  static String? slug(String? value, {bool requiredField = true}) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return requiredField ? 'Slug is required' : null;
    }
    if (!_slugRegex.hasMatch(trimmed)) {
      return 'Use lowercase letters, numbers and hyphens only';
    }
    return null;
  }

  static String? price(
    String? value, {
    String fieldName = 'Price',
    bool requiredField = true,
  }) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return requiredField ? '$fieldName is required' : null;
    }
    final v = double.tryParse(trimmed);
    if (v == null || v < 0) {
      return 'Enter a valid $fieldName (0 or more)';
    }
    return null;
  }

  static String? quantity(String? value, {String fieldName = 'Quantity'}) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return '$fieldName is required';
    }
    final v = int.tryParse(trimmed);
    if (v == null || v < 0) {
      return 'Enter a valid $fieldName (0 or more)';
    }
    return null;
  }

  static String? requiredSelection(
    String? value, {
    String fieldName = 'Category',
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'Please select a $fieldName';
    }
    return null;
  }
}

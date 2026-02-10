class DateFormatter {
  static String relativeTime(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes} min ago';
    }
    if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    }
    if (diff.inDays < 7) {
      return '${diff.inDays}d ago';
    }
    final weeks = (diff.inDays / 7).floor();
    return '${weeks}w ago';
  }
}

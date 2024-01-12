
extension DurationExtensions on Duration {

  // Getter to format a Duration as a concise time string:
  String get toTime {
    // Split the duration string into hours, minutes, and seconds components:
    final timeParts = toString().split('.').first.split(':');

    // Remove leading zeros from each time component for a cleaner format:
    timeParts.removeWhere((element) => element == '0');

    // Combine the remaining time components with colons as separators:
    return timeParts.join(':');
  }
}
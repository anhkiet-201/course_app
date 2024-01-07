import 'package:easy_localization/easy_localization.dart';

/// Extension providing convenient methods for formatting numbers.
extension NumberExtension on num {
  /// Formats the number as currency using the default locale.
  ///
  /// Example:
  /// ```dart
  /// final price = 12345.67;
  /// final formattedPrice = price.pricesFormat; // Output: $12,345.67 (assuming USD)
  /// ```
  String get pricesFormat => NumberFormat.simpleCurrency().format(this);

  /// Formats the number with a consistent number of decimal places.
  ///
  /// Example:
  /// ```dart
  /// final decimal = 12345.6789;
  /// final formattedDecimal = decimal.decimalFormat; // Output: 12,345.68
  /// ```
  String get decimalFormat => NumberFormat.decimalPattern().format(this);

  /// Formats the number as a percentage with a consistent number of decimal places.
  ///
  /// Example:
  /// ```dart
  /// final percent = 0.75;
  /// final formattedPercent = percent.decimalPercentFormat; // Output: 75.00%
  /// ```
  String get decimalPercentFormat => NumberFormat.decimalPercentPattern().format(this);
}

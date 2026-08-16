/// Centralised money formatting for the Elan API.
///
/// Every monetary field the backend returns is an **integer number of cents**.
/// Evidence:
///   * `EarningsSummary.hourlyRate` is divided by 100 at six existing call sites
///     (ride_map_page, upcoming_ride_map_page, both pickup bottom sheets,
///     available_rides_page x2).
///   * `/v1/pricing-config` returns `instructor_rate: 6000` -> $60.00/hr and
///     `instructor_referral_price: 10000` -> $100.00, which is exactly the
///     amount that used to be hardcoded in `ReferralCardThump`.
///
/// If the backend ever switches to major units, flip [kApiMoneyIsCents] and
/// every amount in the app follows. Do not scatter `/ 100` through the UI again.
const bool kApiMoneyIsCents = true;

/// The app is Canada-only. Never render any other currency symbol.
const String kCurrencySymbol = r'$';
const String kCurrencyCode = 'CAD';

extension MoneyX on num? {
  /// Raw API amount -> major units (dollars).
  double get asDollars {
    final value = this ?? 0;
    return kApiMoneyIsCents ? value / 100 : value.toDouble();
  }

  /// `$60.00`
  String get toCad => '$kCurrencySymbol${asDollars.toStringAsFixed(2)}';

  /// `$60.00 CAD`
  String get toCadLabel => '$toCad $kCurrencyCode';

  /// `$60.00/hr`
  String get toCadPerHour => '$toCad/hr';

  /// `$100` — drops the decimals when the amount is a whole dollar figure.
  /// Used for marketing copy (referral hero card) where `$100.00 CAD` reads
  /// clumsily.
  String get toCadCompact {
    final dollars = asDollars;
    final whole = dollars == dollars.roundToDouble();
    return whole
        ? '$kCurrencySymbol${dollars.toStringAsFixed(0)}'
        : toCad;
  }

  /// `$100 CAD`
  String get toCadCompactLabel => '$toCadCompact $kCurrencyCode';
}

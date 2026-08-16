/// Money formatting for a backend that speaks **integer cents (CAD)**.
///
/// Every money field in this API is cents — `total_price: 9240` is $92.40, and
/// `instructor_rate: 4000` is $40.00/hour (see `elan-backend/docs/BUSINESS_LOGIC.md`
/// §2). Formatting money inline is how the two live display bugs happened: the
/// dashboard rendered `available_balance` raw and showed a $266.67 balance as
/// "$26667", while the rate was divided by 100 five files away.
///
/// Route every money value through here so there is exactly one place that
/// knows about the cents convention and the currency symbol.
class Money {
  const Money._();

  static const String symbol = r'$';

  /// Cents → a bare two-decimal amount. `9240` → `"92.40"`.
  static String amount(num? cents) => ((cents ?? 0) / 100).toStringAsFixed(2);

  /// Cents → a display amount. `9240` → `"$92.40"`.
  static String format(num? cents) => '$symbol${amount(cents)}';

  /// Cents-per-hour → a rate label. `4000` → `"$40.00/hr"`.
  static String rate(num? centsPerHour) => '${format(centsPerHour)}/hr';

  /// Like [rate], but renders [dash] for an absent rate.
  ///
  /// A ride session's `hourly_rate` should always be set — every claim path
  /// snapshots it now (§14.9) — so a null here means something is wrong, and
  /// "$0.00/hr" would state a wrong rate confidently.
  static String rateOrDash(num? centsPerHour, {String dash = '--'}) =>
      centsPerHour == null ? dash : rate(centsPerHour);

  /// Cents → a display amount tagged with the currency. `10000` → `"$100.00 CAD"`.
  ///
  /// For places that name the currency explicitly, such as referral bonus copy.
  static String formatWithCurrency(num? cents) => '${format(cents)} CAD';

  /// Like [format], but renders [dash] when the value is genuinely absent
  /// rather than showing a confident "$0.00".
  ///
  /// The server only computes a per-job `ride_price` for `GET /v1/rides/available`;
  /// `GET /v1/rides/upcoming` returns a plain booking with no price attached. This
  /// keeps that distinction honest instead of implying a job is worth nothing.
  static String formatOrDash(num? cents, {String dash = '--'}) =>
      cents == null ? dash : format(cents);
}

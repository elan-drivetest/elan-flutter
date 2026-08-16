import 'package:flutter/services.dart';

/// Canadian phone-number rules, kept out of the widget so they can be unit
/// tested and reused by any screen that collects a number.
///
/// **Why an area-code list is necessary.** Canada and the US share country
/// code `+1` under the North American Numbering Plan, so "starts with +1" does
/// not mean "Canadian" — `+1 212 555 0100` is New York. Restricting the country
/// picker to Canada therefore proves nothing on its own. The only way to tell
/// the two apart is the 3-digit area code (NPA).
///
/// **Maintenance.** The CNA assigns new Canadian NPAs every few years. When one
/// is added and this list has not been updated, a legitimate instructor cannot
/// sign up — so treat [canadianAreaCodes] as something to review periodically,
/// not as a constant that is finished.
class CanadianPhone {
  const CanadianPhone._();

  static const String countryCode = '+1';
  static const String flag = '🇨🇦';

  /// National Significant Number length under the NANP.
  static const int nsnLength = 10;

  /// Every area code currently assigned to Canada, including overlays.
  /// Last reviewed against CNA assignments in 2026.
  static const Set<String> canadianAreaCodes = {
    // Manitoba
    '204', '431', '584',
    // British Columbia
    '236', '250', '604', '672', '778',
    // Ontario
    '226', '249', '289', '343', '365', '382', '416', '437', '519', '548',
    '613', '647', '683', '705', '742', '753', '807', '905',
    // Quebec
    '263', '354', '367', '418', '438', '450', '468', '514', '579', '581',
    '819', '873',
    // Saskatchewan
    '306', '474', '639',
    // Alberta
    '368', '387', '403', '587', '780', '825',
    // Atlantic
    '428', '506', '709', '782', '879', '902',
    // Territories
    '867',
  };

  /// Strips every non-digit, then drops a leading `1` (country code) so both
  /// `(416) 555-0134` and `+1 416 555 0134` reduce to the same 10 digits.
  static String digitsOf(String raw) {
    var d = raw.replaceAll(RegExp(r'\D'), '');
    if (d.length == 11 && d.startsWith('1')) d = d.substring(1);
    return d;
  }

  /// E.164 for the API — `+14165550134`. Returns null when [raw] is not valid.
  static String? toE164(String raw) {
    final d = digitsOf(raw);
    return isValid(d) ? '$countryCode$d' : null;
  }

  static bool isValid(String raw) => validate(raw) == null;

  /// Returns a user-facing message, or null when the number is acceptable.
  ///
  /// Messages name the specific problem rather than saying "invalid number",
  /// because on a signup form a vague rejection is where people give up.
  static String? validate(String? raw) {
    if (raw == null || raw.trim().isEmpty) return 'Please enter a phone number';

    final d = digitsOf(raw);

    if (d.length < nsnLength) return 'Enter all 10 digits';
    if (d.length > nsnLength) return 'That is more than 10 digits';

    final area = d.substring(0, 3);
    final exchange = d.substring(3, 6);

    // NANP structural rules: neither the area code nor the exchange may begin
    // with 0 or 1. Checked before the Canada test so a typo reports as a typo.
    if (area[0] == '0' || area[0] == '1') {
      return 'Area code cannot start with ${area[0]}';
    }
    if (exchange[0] == '0' || exchange[0] == '1') {
      return 'Phone numbers cannot have $exchange after the area code';
    }
    if (area[1] == '9' && area[2] == '9') {
      return 'That area code is not in service';
    }

    if (!canadianAreaCodes.contains(area)) {
      return 'Enter a Canadian number — $area is not a Canadian area code';
    }

    return null;
  }

  /// Pretty form for display: `(416) 555-0134`.
  static String format(String raw) {
    final d = digitsOf(raw);
    if (d.length <= 3) return d;
    if (d.length <= 6) return '(${d.substring(0, 3)}) ${d.substring(3)}';
    return '(${d.substring(0, 3)}) ${d.substring(3, 6)}-'
        '${d.substring(6, d.length.clamp(0, nsnLength))}';
  }
}

/// Masks input to `(###) ###-####` as the user types.
///
/// Keeps the caret at the end of the typed digits rather than letting it jump
/// to the start of the mask, which is the usual bug with formatters like this.
class CanadianPhoneInputFormatter extends TextInputFormatter {
  const CanadianPhoneInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = CanadianPhone.digitsOf(newValue.text);
    final capped = digits.length > CanadianPhone.nsnLength
        ? digits.substring(0, CanadianPhone.nsnLength)
        : digits;

    // Reject the keystroke instead of silently dropping it.
    if (capped.isEmpty) {
      return newValue.copyWith(
        text: '',
        selection: const TextSelection.collapsed(offset: 0),
      );
    }

    final formatted = CanadianPhone.format(capped);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

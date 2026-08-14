/// Central catalogue that turns raw backend error codes / messages into
/// user-friendly text.
///
/// The backend (NestJS) returns terse machine codes such as `notFound`,
/// `otpExpired`, `incorrectPassword`, or bare sentences like
/// `Booking not found`. Those are fine for logs, but must never reach a user.
///
/// [FriendlyErrorMessages.resolve] is the single lookup used by the mapper.
class FriendlyErrorMessages {
  const FriendlyErrorMessages._();

  /// Generic copy used when nothing more specific is known.
  static const String generic =
      'Something went wrong. Please try again.';

  /// Shown when the device has no / poor connectivity.
  static const String network =
      'No internet connection. Check your network and try again.';

  /// Shown when the server is unreachable or times out.
  static const String timeout =
      'The server took too long to respond. Please try again.';

  /// Per HTTP-status fallback, used only when the specific code is unmapped.
  static const Map<int, String> _statusFallback = {
    400: 'We couldn\'t process that request. Please check your input.',
    401: 'Your session has expired. Please sign in again.',
    403: 'You don\'t have permission to do that.',
    404: 'We couldn\'t find what you were looking for.',
    409: 'That action conflicts with the current state. Please refresh.',
    422: 'Please check the highlighted fields and try again.',
    429: 'Too many attempts. Please wait a moment and try again.',
    500: 'Something went wrong on our end. Please try again shortly.',
    502: 'The service is temporarily unavailable. Please try again.',
    503: 'The service is temporarily unavailable. Please try again.',
  };

  /// Human labels for field keys, used to prefix generic validation copy.
  static const Map<String, String> fieldLabels = {
    'email': 'Email',
    'password': 'Password',
    'oldPassword': 'Current password',
    'full_name': 'Full name',
    'phone_number': 'Phone number',
    'address': 'Address',
    'otp': 'Verification code',
    'active': 'Account',
    'year': 'Year',
    'license_number': 'License number',
    'code': 'Referral code',
  };

  /// Exact backend code / message -> friendly text.
  /// Keys are matched case-insensitively (see [resolve]).
  static const Map<String, String> _codes = {
    // ---- Global / auth guards ----
    'sorry something went wrong.': generic,
    'unauthorised.': 'Your session has expired. Please sign in again.',
    'unauthorised': 'Your session has expired. Please sign in again.',
    'unauthorized': 'Your session has expired. Please sign in again.',
    'invalid token.': 'Your session is invalid. Please sign in again.',
    'invalid token': 'Your session is invalid. Please sign in again.',
    'the token has expired.':
        'Your session has expired. Please sign in again.',
    'too many requests':
        'Too many attempts. Please wait a moment and try again.',

    // ---- Login ----
    'notfound': 'We couldn\'t find an account with that email.',
    'userisnotactive':
        'Your account isn\'t active yet. Please verify your email first.',
    'incorrectpassword': 'The email or password is incorrect.',

    // ---- Register ----
    'emailalreadyexists': 'An account with this email already exists.',
    'phonenumberalreadyexists':
        'An account with this phone number already exists.',
    'instructor not created':
        'We couldn\'t create your account. Please try again.',
    'phonenumbermissing':
        'A phone number is required to send your verification code.',

    // ---- OTP ----
    'otpresendcooldown':
        'Please wait a minute before requesting another code.',
    'otptoomanyrequests':
        'You\'ve requested too many codes. Please try again later.',
    'otpnotfound':
        'No active verification code found. Please request a new one.',
    'otpexpired': 'This code has expired. Please request a new one.',
    'otpmaxattempts':
        'Too many incorrect attempts. Please request a new code.',
    'otpinvalid': 'That code is incorrect. Please try again.',

    // ---- Forgot password ----
    'emailnotexists': 'We couldn\'t find an account with that email.',

    // ---- Update profile ----
    'usernotfound': 'We couldn\'t find your account. Please sign in again.',
    'missingoldpassword':
        'Please enter your current password to set a new one.',
    'incorrectoldpassword': 'Your current password is incorrect.',
    'emailexists': 'That email is already in use by another account.',
    'profile not found':
        'We couldn\'t load your profile. Please sign in again.',

    // ---- Instructor / Stripe ----
    'instructor not found':
        'We couldn\'t find your instructor profile. Please sign in again.',
    'instructor details not found':
        'We couldn\'t find your instructor profile. Please sign in again.',
    'stripe onboarding failed':
        'We couldn\'t start bank onboarding. Please try again.',
    'instructor not connected to stripe':
        'Please finish bank onboarding before continuing.',
    'instructor stripe account not connected':
        'Please finish bank onboarding before accepting rides.',

    // ---- Rides ----
    'ride pricing is temporarily unavailable':
        'Ride pricing is temporarily unavailable. Please try again shortly.',
    'booking not found': 'This booking is no longer available.',
    'booking already accepted':
        'This booking has already been taken by another instructor.',
    'test date has already passed':
        'This test date has already passed.',
    'you already have a booking on this date':
        'You already have a ride booked on this date.',
    'ride not found': 'We couldn\'t find that ride.',
    'ride session not found': 'We couldn\'t find that ride.',
    'booking is not paid or is no longer active':
        'This booking isn\'t paid or is no longer active.',
    'ride session has already started': 'This ride has already started.',
    'ride session can be started within 6 hours of test date':
        'A ride can only be started within 6 hours of the test time.',
    'you are not assigned to this ride':
        'You aren\'t assigned to this ride.',
    'ride session can not be transferred':
        'This ride can no longer be transferred.',
    'transfer requests must be made at least 6 hours before the start time':
        'Transfers must be requested at least 6 hours before the start time.',
    'ride session cannot be stopped':
        'This ride can\'t be stopped right now.',
    'something went wrong': generic,

    // ---- Referral codes ----
    'referral code not found': 'That referral code doesn\'t exist.',
    'referral code is not active': 'That referral code is no longer active.',
    'referral code has expired': 'That referral code has expired.',
    'you have already claimed this referral code':
        'You\'ve already claimed this referral code.',
    'you cannot claim your own referral code':
        'You can\'t claim your own referral code.',
    'you have already claimed a referral code':
        'You\'ve already claimed a referral code.',
    'you have already used a referral code from this instructor':
        'You\'ve already used a referral code from this instructor.',
    'referral code usage limit reached':
        'This referral code has reached its usage limit.',
  };

  /// Prefixes of templated codes that carry a runtime suffix after `:`.
  static const Map<String, String> _templatePrefixes = {
    'needloginviaprovider':
        'This account uses social sign-in. Please continue with your provider.',
    'unable to calculate distance':
        'We couldn\'t calculate the ride distance. Please try again.',
  };

  /// Resolve a single raw code/message to friendly text.
  ///
  /// Returns `null` when no mapping is found, so the caller can decide whether
  /// to fall back on status code or pass the (possibly readable) original.
  static String? resolve(String? raw) {
    if (raw == null) return null;
    final trimmed = raw.trim();
    if (trimmed.isEmpty) return null;

    final key = trimmed.toLowerCase();

    final direct = _codes[key];
    if (direct != null) return direct;

    // Templated codes: `needLoginViaProvider:google`, `Unable to calc...: X`.
    final head = key.split(':').first.trim();
    for (final entry in _templatePrefixes.entries) {
      if (head == entry.key || key.startsWith(entry.key)) {
        return entry.value;
      }
    }

    // class-validator style messages ("email must be an email", ...).
    final validation = _resolveValidation(trimmed);
    if (validation != null) return validation;

    return null;
  }

  /// Friendly fallback for an HTTP status when the code is unknown.
  static String forStatus(int? status) =>
      _statusFallback[status ?? 0] ?? generic;

  /// Normalises the most common class-validator messages into friendly copy.
  static String? _resolveValidation(String raw) {
    final lower = raw.toLowerCase();
    if (!_looksLikeValidation(lower)) return null;

    final field = _fieldFromValidation(raw);
    final label = field != null ? (fieldLabels[field] ?? _titleize(field)) : null;

    if (lower.contains('must be an email')) {
      return 'Please enter a valid email address.';
    }
    if (lower.contains('should not be empty') ||
        lower.contains('must be not empty') ||
        lower.contains('mustbenotempty')) {
      return label != null ? '$label is required.' : 'This field is required.';
    }
    if (lower.contains('must be a valid phone number')) {
      return 'Please enter a valid phone number.';
    }
    final longer = RegExp(r'longer than or equal to (\d+)').firstMatch(lower);
    if (longer != null) {
      final n = longer.group(1);
      return label != null
          ? '$label must be at least $n characters.'
          : 'Must be at least $n characters.';
    }
    final shorter = RegExp(r'shorter than or equal to (\d+)').firstMatch(lower);
    if (shorter != null) {
      final n = shorter.group(1);
      return label != null
          ? '$label must be $n characters or fewer.'
          : 'Must be $n characters or fewer.';
    }
    if (lower.contains('must be a url')) {
      return label != null
          ? '$label must be a valid URL.'
          : 'Please enter a valid URL.';
    }
    // Readable enough as-is; capitalise the field.
    return label != null ? _replaceFieldWithLabel(raw, field!, label) : raw;
  }

  static bool _looksLikeValidation(String lower) =>
      lower.contains('must be') ||
      lower.contains('should not be empty') ||
      lower.contains('longer than') ||
      lower.contains('shorter than') ||
      lower.contains('one of the following values');

  static String? _fieldFromValidation(String raw) {
    // class-validator messages start with the field name.
    final first = raw.split(' ').first;
    if (first.isEmpty) return null;
    return first;
  }

  static String _replaceFieldWithLabel(String raw, String field, String label) {
    if (raw.startsWith(field)) {
      return label + raw.substring(field.length);
    }
    return raw;
  }

  static String _titleize(String field) {
    final words = field.replaceAll('_', ' ').split(' ');
    return words
        .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
        .join(' ');
  }
}

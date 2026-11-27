import 'package:injectable/injectable.dart';

const bool debugMode = false;

@injectable
class ApiEndpoints {
  static const String baseUrl = "https://api-dev.elanroadtestrental.ca";
  static const String loginInstructorUrl = "/v1/auth/instructor/email/login";
  static const String registerInstructorUrl =
      "/v1/auth/instructor/email/register";
  static const String logOutInstructorUrl = "/v1/auth/instructor/logout";
  static const String resetPasswordUrl = "/v1/auth/instructor/forgot/password";
  static const String submitNewPasswordUrl = "/v1/auth/reset/password";
  static const String forgotPasswordVerifyUrl =
      "/v1/auth/instructor/forgot/password/verify";
  static const String verifyOtpUrl = "/v1/auth/instructor/otp/verify";
  static const String resendOtpUrl = "/v1/auth/instructor/otp/resend";
  static const String refreshCookieUrl = "/v1/auth/instructor/refresh";
  static const String confirmEmailUrl = "/v1/auth/email/confirm";
  static const String fileUploadUrl = "/v1/files/upload";
  static const String pricingConfigUrl = "/v1/pricing-config";
  static const String instructorInfoUrl = "/v1/auth/instructor/me";
  static const String patchInstructorInfoUrl = "/v1/auth/instructor/me";

  /// `DELETE`: the instructor deletes their own account (Play policy requires
  /// it in-app). Returns 204 and clears the auth cookies server-side.
  static const String deleteInstructorAccountUrl = "/v1/auth/instructor/me";

  /// Legal acceptance (Forge's contract, 2026-11-27).
  static const String legalStatusUrl = "/v1/legal/status";
  static const String legalAcceptUrl = "/v1/legal/accept";

  /// Public copies of the documents, for the settings screen and signup links.
  /// Stable URLs with `#section-N-N` anchors (Picasso).
  static const String websiteUrl = "https://www.elanroadtestrental.ca";
  static const String privacyPolicyPageUrl = "$websiteUrl/privacy";
  static const String termsPageUrl = "$websiteUrl/terms";
  static const String providerAgreementPageUrl = "$websiteUrl/provider-agreement";
  static const String deleteAccountPageUrl = "$websiteUrl/delete-account#instructors";
  static const String updateInstructorVehicleInfoUrl =
      "/v1/instructors/vehicle";
  static const String instructorDashboardUrl = "/v1/instructors/dashboard";

  static const String referralCodeSummaryUrl =
      "/v1/instructors/referral-codes/summary";

  static const String locationTrackingUrl = "/v1/rides/location-tracking";

  /// Public and unauthenticated — safe to call before login.

  static String getAvailableRidesUrl = "/v1/rides/available";

  static String getCompletedRidesUrl({
    String? cursor,
    int? limit,
    String? direction,
    String? orderBy,
    String? orderDirection,
  }) {
    final queryParams = <String, String>{};

    if (limit != null) queryParams['limit'] = '$limit';
    if (cursor != null) queryParams['cursor'] = cursor;
    if (direction != null) queryParams['direction'] = direction;
    if (orderBy != null) queryParams['orderBy'] = orderBy;
    if (orderDirection != null) queryParams['orderDirection'] = orderDirection;

    final queryString = Uri(queryParameters: queryParams).query;

    return "/v1/rides/completed${queryString.isNotEmpty ? '?$queryString' : ''}";
  }

  static const String getStripeStatusUrl =
      "/v1/instructors/stripe-onboarding-status";
  static const String requestStripeUrl = "/v1/instructors/stripe-onboarding";

  static String getUpcomingRidesUrl({
    int? limit = 10,
    String? direction = "forward",
    String? orderBy = "created_at",
    String? orderDirection = "desc",
  }) {
    return "/v1/rides/upcoming"
        "?limit=$limit"
        "&direction=$direction"
        "&orderBy=$orderBy"
        "&orderDirection=$orderDirection";
  }

  static const String acceptRideUrl = "/v1/rides/accept";
  static const String transferRideUrl = "/v1/rides/transfer";
  static const String currentRideUrl = "/v1/rides/current";
  static const String startRideUrl = "/v1/rides/start";
  static const String stopRideUrl = "/v1/rides/stop";

  static String getGenerateReferralCodesUrl({
    int? limit = 10,
    String? direction = "forward",
    String? orderBy = "created_at",
    String? orderDirection = "desc",
  }) {
    return "/v1/instructors/referral-codes"
        "?limit=$limit"
        "&direction=$direction"
        "&orderBy=$orderBy"
        "&orderDirection=$orderDirection";
  }

  static const String generateReferralCodeUrl =
      "/v1/instructors/referral-codes";

  static const String getClaimedReferralCodesUrl =
      "/v1/instructors/referral-codes";
  static const String claimReferralCodesUrl =
      "/v1/instructors/referral-codes/claim";
}

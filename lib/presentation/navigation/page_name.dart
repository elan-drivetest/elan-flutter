enum PagesName {
  splashPage(title: "Splash Page", path: "/"),
  authPage(title: "Auth Page", path: "/auth-page"),
  loginPage(title: "Login Page", path: "/login-page"),
  registrationPage(title: "Registration Page", path: "registration-page"),
  forgetPasswordPage(title: "Forget Password Page", path: "forget-password-page"),
  otpVerificationPage(title: "OTP Verification Page", path: "otp-verification-page"),
  resetPasswordPage(title: "Reset Password Page", path: "reset-password-page"),
  profilePage(title: "Profile Page", path: "/profile-page"),
  dashboardPage(title: "Dashboard Page", path: "/dashboard-page"),
  stripeVerifyPage(title: "Stripe Verify Page", path: "/stripe-verify-page"),
  addVehiclePage(title: "Add Vehicle Page", path: "add-vehicle-page"),
  addLicensePage(title: "Add License Page", path: "add-license-page"),
  directionMapPage(title: "Direction Map Page", path: "direction-map-page"),
  rideMapPage(title: "Ride Map Page", path: "ride-map-page"),
  upcomingRideMapPage(title: "Upcoming Ride Map Page", path: "upcoming-ride-map-page"),
  availableRidesPage(title: "Available Rides Page", path: "/available-rides-page"),
  referralCodePage(title: "Referral Code Page", path: "/referral-code-page");

  const PagesName({required this.title, required this.path});
  final String title;
  final String path;
}

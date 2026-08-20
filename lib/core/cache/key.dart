enum Key {
  /// Ride-session id of the ride currently being tracked — what
  /// `/rides/location-tracking` and `/rides/stop` expect.
  ///
  /// A companion `RIDE_BOOKING_ID` key used to sit here holding the other half
  /// of the pair, because `/rides/start` takes a booking id, `/rides/stop`
  /// takes a session id, and no RideSession response returned `booking_id` to
  /// join them (§14.4). Every RideSession now carries `booking_id`
  /// (`INSTRUCTOR_APP_RIDE_JOURNEY.md` §8.2), so the app no longer keeps that
  /// link itself.
  rideSessionId("RIDE_SESSION_ID"),

  /// Last successfully fetched `GET /v1/pricing-config` payload, stored as raw
  /// JSON so a newly added server key survives a round-trip without a model bump.
  pricingConfig("PRICING_CONFIG"),

  /// GPS breadcrumbs captured but not yet accepted by the server.
  ///
  /// Persisted rather than held in memory because the ride's reported distance
  /// is summed from these points (§5.2) — a buffer lost to a process death is
  /// distance the instructor never gets credited for.
  pendingLocationPings("PENDING_LOCATION_PINGS"),

  /// The booking currently being driven, as raw JSON.
  ///
  /// `GET /v1/rides/current` returns a RideSession with no booking *details* —
  /// no name, no addresses, no test centre. It now carries `booking_id` (§8.8),
  /// but that id cannot be redeemed: there is no instructor get-booking-by-id
  /// endpoint, and `/rides/upcoming` drops a ride the moment it starts. So this
  /// remains the **only** copy of the booking being driven. Written when the
  /// instructor taps Start, cleared at Stop.
  activeBooking("ACTIVE_BOOKING"),

  /// Whether auth cookies were last known to exist on disk.
  ///
  /// The cookies themselves are httpOnly and live in the `PersistCookieJar`,
  /// which the app cannot inspect for validity — it can only find out by making
  /// a request. That made every launch a coin toss: if the refresh call failed
  /// for *any* reason, including no connection, the splash sent the instructor
  /// to the login screen even though their session was perfectly good.
  ///
  /// This marker records "we have had a working session on this device". It
  /// lets a failed refresh be read correctly: a **401 means the server rejected
  /// us** and the session is over, while a timeout or a 5xx means we simply
  /// could not ask, and the instructor stays signed in. Set on login, on signup
  /// OTP verification and on every successful refresh; cleared only on explicit
  /// logout or a server-rejected session.
  hasSession("HAS_SESSION"),

  /// Whether the onboarding carousel has been shown on this device.
  ///
  /// Lives here rather than in a `FlutterSecureStorage()` of its own, which is
  /// where it used to sit. That bare instance took the plugin's *default*
  /// Android backend while [CacheManager] is configured for
  /// `encryptedSharedPreferences` — two different stores, one of which nothing
  /// else in the app used or verified.
  hasSeenOnboarding("HAS_SEEN_ONBOARDING");

  final String keyValue;

  const Key(this.keyValue);
}

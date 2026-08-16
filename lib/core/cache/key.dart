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
  activeBooking("ACTIVE_BOOKING");

  final String keyValue;

  const Key(this.keyValue);
}

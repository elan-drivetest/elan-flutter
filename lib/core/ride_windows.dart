/// Client-side mirrors of the server's ride timing gates.
///
/// Both windows are admin-editable settings served by `GET /v1/pricing-config`,
/// so nothing here may hardcode 6 hours. The server re-enforces both rules
/// independently — these predicates exist so the UI can disable a button rather
/// than let the request come back 400 (see `BUSINESS_LOGIC.md` §17.8).
///
/// The comparisons below match `RidesService.start()` and `RidesService.transfer()`
/// exactly, including their boundary behaviour, which is why they are written as
/// `<=` / `>` rather than the other way round:
///
/// * start    — server throws when `diff >  startWindowHours`  → allowed at `diff <= window`
/// * transfer — server throws when `diff <= transferCutoffHours` → allowed at `diff >  cutoff`
///
/// At exactly the boundary (`diff == 6`) start is permitted and transfer is not,
/// so the two are precise complements there.
class RideWindows {
  const RideWindows._();

  /// Fractional hours from [now] until [testDate], compared in UTC as the
  /// server does. Negative once the test date has passed.
  static double hoursUntil(DateTime testDate, {DateTime? now}) {
    final from = (now ?? DateTime.now()).toUtc();
    final to = testDate.toUtc();
    return to.difference(from).inMicroseconds / Duration.microsecondsPerHour;
  }

  /// Whether the instructor may tap Start.
  ///
  /// Mirrors `RidesService.start()`: allowed once the test is within
  /// [startWindowHours]. The server sets no lower bound, so this stays true
  /// after the test date passes — a late start is still a legitimate start.
  static bool canStart({
    required DateTime? testDate,
    required num startWindowHours,
    DateTime? now,
  }) {
    if (testDate == null) return false;
    return hoursUntil(testDate, now: now) <= startWindowHours;
  }

  /// Whether the instructor may still hand the job back.
  ///
  /// Mirrors `RidesService.transfer()`: allowed only while the start is more
  /// than [transferCutoffHours] away.
  static bool canTransfer({
    required DateTime? testDate,
    required num transferCutoffHours,
    DateTime? now,
  }) {
    if (testDate == null) return false;
    return hoursUntil(testDate, now: now) > transferCutoffHours;
  }
}

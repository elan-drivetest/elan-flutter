import 'package:elan/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// The pieces every ride card is built from.
///
/// `RideCard` (job board), `UpcomingRideCard` and `RideHistoryCard` were three
/// separate ~400-line files that drew the same card and had drifted apart:
/// the job board used raw `Colors.blue` and a hardcoded `0xFF4CAF50` where the
/// other two used [RideCardColors], so the same avatar and the same timeline
/// rendered in different blues on two tabs. Only one of the three was tappable.
///
/// They differ in exactly three ways, which is what each card still owns: what
/// sits opposite the type pill, what sits under the customer's name, and what
/// actions run along the bottom.

/// The white rounded container.
///
/// [onTap] is optional — ride history has nowhere to navigate to — but when it
/// is given the ripple is clipped to the card's own radius.
class RideCardShell extends StatelessWidget {
  const RideCardShell({super.key, required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  static final BorderRadius _radius = BorderRadius.circular(16);

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [child],
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: _radius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100, width: 1.5),
      ),
      // The ink has to sit *inside* the decoration, on a transparent Material.
      // Wrapping the decorated box in the InkWell instead paints the splash
      // beneath the card's own white background, where it is never seen.
      child: onTap == null
          ? content
          : Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: _radius,
                onTap: onTap,
                child: content,
              ),
            ),
    );
  }
}

/// The test-type badge — "G", "G2".
class RideTypePill extends StatelessWidget {
  const RideTypePill({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: RideCardColors.greenTint,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        type,
        style: const TextStyle(
          // Green 800 on the tint: 4.67:1. The accent green sat at 2.53:1 here,
          // which is unreadable at 12sp.
          color: RideCardColors.actionGreen,
          fontWeight: FontWeight.bold,
          fontSize: 12,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

/// Avatar, name, and whatever each card puts underneath — a time, a phone
/// number, nothing at all.
class RideCardCustomer extends StatelessWidget {
  const RideCardCustomer({super.key, required this.name, this.subtitle});

  final String name;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: RideCardColors.linkTint,
          child: Icon(Icons.person, color: RideCardColors.link),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                subtitle!,
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// Secondary action that dials the customer.
///
/// Replaces the raw phone number the job-board and history cards used to print
/// as underlined text. A 10-digit number is not information an instructor reads
/// — it is a thing they tap — and rendering it as text cost enough width to
/// truncate the date beside it.
///
/// Outlined rather than filled so it reads as secondary to the card's primary
/// action, and blue rather than green so the two are not competing for the same
/// visual weight.
class RideCallButton extends StatelessWidget {
  const RideCallButton({super.key, required this.name, required this.phone});

  /// Only used for the screen-reader label — "Call" alone is ambiguous when a
  /// list has several cards.
  final String name;
  final String phone;

  Future<void> _dial() async {
    final uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: name.trim().isEmpty ? 'Call' : 'Call $name',
      child: OutlinedButton.icon(
        onPressed: _dial,
        icon: const Icon(Icons.phone_outlined, size: 18),
        label:
            const Text('Call', style: TextStyle(fontWeight: FontWeight.w600)),
        style: OutlinedButton.styleFrom(
          foregroundColor: RideCardColors.link,
          side: const BorderSide(color: RideCardColors.link),
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

/// The distance the **price** was computed from.
///
/// This is the §14.1 gap as it survived on the list screens. The detail sheet
/// and the active-ride map both show "Round trip" already, but the cards showed
/// no distance at all — so in a list, `ride_price` had no visible basis. Two
/// jobs whose routes look comparable can price 18x apart, because the number
/// being priced (`booking.pickup_distance`, one-way, doubled) is not the number
/// the app computes for the map (the deadhead from wherever the instructor is
/// standing). Only the first one reaches the estimate.
///
/// Showing it makes a corrupt booking self-evident: a row with a geocode that
/// landed in the wrong province reads as "3015.0 km" beside its price, instead
/// of an unexplained four-figure number.
///
/// Deliberately no plausibility threshold here — what counts as too far is a
/// business rule, and inventing a client-side limit would put a second,
/// drifting copy of it in the app.
class RideDistanceRow extends StatelessWidget {
  const RideDistanceRow({
    super.key,
    required this.roundTripKm,
    required this.meetAtCentre,
  });

  /// `2 x booking.pickup_distance` — null for meet-at-centre, and null rather
  /// than `0.0` when absent (§5.1).
  final double? roundTripKm;

  final bool meetAtCentre;

  @override
  Widget build(BuildContext context) {
    // Shape B prices no driving at all. Saying so is the point: "$1869 for no
    // driving" is a question an instructor can ask; a blank row is not.
    final value = meetAtCentre
        ? 'No pickup run'
        : (roundTripKm == null
            ? '--'
            : '${roundTripKm!.toStringAsFixed(1)} km');

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          const Icon(Icons.route, size: 16, color: RideCardColors.actionGreen),
          const SizedBox(width: 8),
          Text(
            'Round trip',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

/// A hairline with the spacing the cards use around it.
class RideCardDivider extends StatelessWidget {
  const RideCardDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Divider(color: RideCardColors.hairline, height: 1),
    );
  }
}

/// Where the instructor goes, drawn as a timeline.
///
/// Two things this fixes, both visible on the job board:
///
/// **A meet-at-centre ride has no pickup.** The card rendered a "Pickup" label
/// over an empty string, because `pickup_address` is null for those bookings
/// and the caller passed `?? ''` straight through — which reads as missing
/// data rather than as the arrangement it is (§2, §3).
///
/// The timeline keeps both stops either way, so every card in the app has the
/// same silhouette and a meet-at-centre job does not look like a different kind
/// of object in the list. The pickup stop just states the arrangement in three
/// words instead of an address. An earlier pass collapsed it to a single stop
/// with an explanatory sentence underneath; that was more text and a different
/// shape, for a case the instructor already understands.
///
/// **The test centre was printed twice.** Every card drew a "Test centre" row
/// here and then a second grey "Test Center" panel below it holding the same
/// address — `RideHistoryCard` passed `dropOffLocation` to both, and its own
/// comment admitted it. The centre's *name* is what an instructor navigates by
/// and what the signage says, so it leads the destination stop and the address
/// sits under it. The panel is gone.
class RideJourney extends StatelessWidget {
  const RideJourney({
    super.key,
    required this.meetAtCentre,
    required this.pickupAddress,
    required this.testCentreName,
    required this.testCentreAddress,
  });

  /// `booking.meet_at_center` — authoritative and always present (§2). Never
  /// infer this from a null pickup: a stale pickup address on a meet-at-centre
  /// booking would route the instructor to the wrong place.
  final bool meetAtCentre;

  final String pickupAddress;
  final String testCentreName;
  final String testCentreAddress;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const SizedBox(height: 2),
            _originDot(),
            Container(width: 2, height: 44, color: Colors.grey.shade200),
            _destinationDot(),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (meetAtCentre)
                const _Stop(label: 'Pickup', title: 'Meet at test centre')
              else
                _Stop(
                  label: 'Pickup',
                  // An empty pickup on a shape-A booking *is* a data problem,
                  // unlike shape B — say so rather than showing a blank row.
                  title: pickupAddress.trim().isEmpty
                      ? 'Address not provided'
                      : _primaryLine(pickupAddress),
                  subtitle: _secondaryLine(pickupAddress),
                  muted: pickupAddress.trim().isEmpty,
                ),
              const SizedBox(height: 20),
              _testCentreStop(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _testCentreStop() {
    final name = testCentreName.trim();
    final address = testCentreAddress.trim();
    final hasName = name.isNotEmpty;

    return _Stop(
      label: 'Test centre',
      title: hasName
          ? name
          : (address.isEmpty ? 'Test centre not provided' : address),
      subtitle: hasName && address.isNotEmpty ? address : null,
      muted: !hasName && address.isEmpty,
    );
  }

  Widget _originDot() => Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: RideCardColors.link, width: 3),
        ),
      );

  /// The destination marker carries meaning — which end of the timeline is the
  /// centre — so it needs the 3:1 WCAG asks of graphical objects. The accent
  /// green managed 2.78:1.
  Widget _destinationDot() => const DecoratedBox(
        decoration: BoxDecoration(
          color: RideCardColors.actionGreen,
          shape: BoxShape.circle,
        ),
        child: SizedBox(width: 12, height: 12),
      );

  /// Addresses are split after the second comma so the street sits on the
  /// primary line and the city/postcode drops to the secondary one.
  static String _primaryLine(String address) {
    final parts = address.split(',');
    if (parts.length <= 1) return address.trim();
    return parts.take(2).join(',').trim();
  }

  static String? _secondaryLine(String address) {
    final parts = address.split(',');
    if (parts.length <= 2) return null;
    final rest = parts.skip(2).join(',').trim();
    return rest.isEmpty ? null : rest;
  }
}

/// One labelled stop on the timeline.
class _Stop extends StatelessWidget {
  const _Stop({
    required this.label,
    required this.title,
    this.subtitle,
    this.muted = false,
  });

  final String label;
  final String title;
  final String? subtitle;

  /// Renders [title] as placeholder copy rather than an address.
  final bool muted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            height: 1.3,
            color: muted ? RideCardColors.mutedText : Colors.black87,
            fontWeight: muted ? FontWeight.w400 : FontWeight.w600,
            fontStyle: muted ? FontStyle.italic : FontStyle.normal,
          ),
        ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              subtitle!,
              style: TextStyle(
                fontSize: 13,
                height: 1.3,
                color: Colors.grey.shade600,
              ),
            ),
          ),
      ],
    );
  }
}


import 'package:elan/domain/common/meta/meta.dart';
import 'package:elan/domain/common/ride/ride.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'ride_response.freezed.dart';
part 'ride_response.g.dart';

@freezed
class RideResponse with _$RideResponse {
  const factory RideResponse({
    @JsonKey(name: "data")
    List<Ride>? data,
    @JsonKey(name: "meta")
    Meta? meta,
  }) = _RideResponse;

  factory RideResponse.fromJson(Map<String, dynamic> json) => _$RideResponseFromJson(json);
}

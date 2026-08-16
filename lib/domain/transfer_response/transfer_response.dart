import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_response.freezed.dart';
part 'transfer_response.g.dart';

@freezed
class TransferResponse with _$TransferResponse {
  const factory TransferResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "transfer_reason") String? transferReason,
  }) = _TransferResponse;

  factory TransferResponse.fromJson(Map<String, dynamic> json) =>
      _$TransferResponseFromJson(json);
}

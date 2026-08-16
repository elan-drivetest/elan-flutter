import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta.freezed.dart';
part 'meta.g.dart';

@freezed
class Meta with _$Meta {
  const factory Meta({
    @JsonKey(name: "limit") int? limit,
    @JsonKey(name: "hasNextPage") bool? hasNextPage,
    @JsonKey(name: "nextCursor") String? nextCursor,
    @JsonKey(name: "prevCursor") String? prevCursor,
    @JsonKey(name: "hasPreviousPage") bool? hasPreviousPage,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

import 'package:elan/domain/common/ride/ride.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';


class PagingStateConverter extends JsonConverter<PagingState<int, Ride>, Map<String, dynamic>> {
  const PagingStateConverter();

  @override
  PagingState<int, Ride> fromJson(Map<String, dynamic> json) {
    return PagingState(
      pages: (json['pages'] as List<dynamic>?)
          ?.map((list) => (list as List<dynamic>)
          .map((e) => Ride.fromJson(e as Map<String, dynamic>))
          .toList())
          .toList(),
      keys: (json['keys'] as List<dynamic>?)?.map((e) => e as int).toList(),
      error: json['error'],
      hasNextPage: json['hasNextPage'] as bool,
      isLoading: json['isLoading'] as bool,
    );
  }

  @override
  Map<String, dynamic> toJson(PagingState<int, Ride> state) {
    return {
      'pages': state.pages
          ?.map((list) => list.map((product) => product.toJson()).toList())
          .toList(),
      'keys': state.keys,
      'error': state.error,
      'hasNextPage': state.hasNextPage,
      'isLoading': state.isLoading,
    };
  }
}

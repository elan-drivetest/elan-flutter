// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
//
// mixin CursorPaginationMixin<T> on BlocBase {
//   /// Helper to fetch a paginated list and update the PagingController.
//   ///
//   /// - `fetchFn` should take the current cursor and return either a failure or response.
//   /// - `pagingController` is passed from the UI layer.
//   /// - `extractData` gets the list of items from the response.
//   /// - `extractNextCursor` gets the nextCursor from the response.
//   /// - `hasMoreFn` optionally controls hasNextPage logic.
//   Future<void> handlePaginatedRequest<ResponseType>({
//     required String? cursor,
//     required PagingController<String?, T> pagingController,
//     required Future<Either<Object, ResponseType>> Function(String? cursor) fetchFn,
//     required List<T> Function(ResponseType response) extractData,
//     required String? Function(ResponseType response) extractNextCursor,
//     bool Function(ResponseType response)? hasMoreFn,
//     void Function()? onSuccess,
//     void Function(Object error)? onError,
//   }) async {
//     final result = await fetchFn(cursor);
//
//     result.fold(
//           (error) {
//         pagingController.error = error;
//         onError?.call(error);
//       },
//           (response) {
//         final newItems = extractData(response);
//         final nextCursor = extractNextCursor(response);
//         final hasMore = hasMoreFn?.call(response) ?? (nextCursor != null);
//
//         if (hasMore && nextCursor != null) {
//           pagingController.appendPage(newItems, nextCursor);
//         } else {
//           pagingController.appendLastPage(newItems);
//         }
//
//         onSuccess?.call();
//       },
//     );
//   }
// }

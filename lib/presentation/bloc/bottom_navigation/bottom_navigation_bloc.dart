import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';
part 'bottom_navigation_bloc.freezed.dart';

@injectable
class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc()
      : super(const BottomNavigationState.route(tabIndex: 0)) {
    on<BottomNavigationEvent>((event, emit) {
      event.when(
          tabChange: (tabIndex) {
        emit(BottomNavigationState.route(tabIndex: tabIndex));
      });
    });
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobs_api/jobs_api.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<CustomHomeEvent>(_onCustomHomeEvent);
  }

  FutureOr<void> _onCustomHomeEvent(
    CustomHomeEvent event,
    Emitter<HomeState> emit,
  ) {
    // TODO: Add Logic
  }
}

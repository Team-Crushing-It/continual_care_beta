import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobs_api/jobs_api.dart';
import 'package:jobs_repository/jobs_repository.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required JobsRepository jobsRepository,
  })  : _jobsRepository = jobsRepository,
        super(const HomeState()) {
    on<CustomHomeEvent>(_onCustomHomeEvent);
    on<HomeSubscriptionRequested>(_onSubscriptionRequested);
  }

  final JobsRepository _jobsRepository;

  FutureOr<void> _onCustomHomeEvent(
    CustomHomeEvent event,
    Emitter<HomeState> emit,
  ) {
    // TODO: Add Logic
  }

  Future<void> _onSubscriptionRequested(
      HomeSubscriptionRequested event, Emitter<HomeState> emit) async {
        print('subscription rques');
    await emit.forEach<List<User>>(_jobsRepository.getUsers(), onData: (users) {
      return state.copyWith(caregivers: users);
    });
  }
}

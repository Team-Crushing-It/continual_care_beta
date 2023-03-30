import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'jobs_overview_event.dart';
part 'jobs_overview_state.dart';

class JobsOverviewBloc extends Bloc<JobsOverviewEvent, JobsOverviewState> {
  JobsOverviewBloc() : super(const JobsOverviewInitial()) {
    on<CustomJobsOverviewEvent>(_onCustomJobsOverviewEvent);
  }

  FutureOr<void> _onCustomJobsOverviewEvent(
    CustomJobsOverviewEvent event,
    Emitter<JobsOverviewState> emit,
  ) {
    // TODO: Add Logic
  }
}

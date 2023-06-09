import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobs_repository/jobs_repository.dart';

part 'home_overview_event.dart';
part 'home_overview_state.dart';

class HomeOverviewBloc extends Bloc<HomeOverviewEvent, HomeOverviewState> {
  HomeOverviewBloc({
    required JobsRepository jobsRepository,
  })  : _jobsRepository = jobsRepository,
        super(HomeOverviewState()) {
    on<HomeOverviewSubscriptionRequested>(_onSubscriptionRequested);
  }

  final JobsRepository _jobsRepository;

  Future<void> _onSubscriptionRequested(HomeOverviewSubscriptionRequested event,
      Emitter<HomeOverviewState> emit) async {
    await emit.forEach<List<Job>>(_jobsRepository.getJobs(event.group),
        onData: (jobs) {
      // this is used to determine the upcoming job
      // this gets all the jobs that are within a day
      // that are incomplete.
      final upcomingJobs = jobs
          .where((element) =>
              element.startTime
                  .isAfter(DateTime.now().subtract(Duration(days: 1))) &&
              element.isCompleted == false)
          .toList();

      // upcomingJobs.sort(((a, b) => a.startTime.compareTo(b.startTime)));

      final upcomingJob = upcomingJobs.isEmpty ? null : upcomingJobs.first;

      // this is used to determine the most recent job
      final recentJobs = jobs
          .where((element) =>
              element.startTime
                  .isBefore(DateTime.now().add(Duration(days: 1))) &&
              element.isCompleted == true)
          .toList();

      recentJobs.sort(((a, b) => b.startTime.compareTo(a.startTime)));

      final recentJob = recentJobs.isEmpty ? null : recentJobs.first;

      return state.copyWith(
        jobs: jobs.where((element) => element.isCompleted == true).toList()
          ..sort(((a, b) => b.startTime.compareTo(a.startTime))),
        upcomingJob: upcomingJob,
        recentJob: recentJob,
      );
    });
  }
}

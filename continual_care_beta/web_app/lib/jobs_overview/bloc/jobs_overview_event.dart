part of 'jobs_overview_bloc.dart';

abstract class JobsOverviewEvent  extends Equatable {
  const JobsOverviewEvent();

  @override
  List<Object> get props => [];

}

/// {@template custom_jobs_overview_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomJobsOverviewEvent extends JobsOverviewEvent {
  /// {@macro custom_jobs_overview_event}
  const CustomJobsOverviewEvent();
}

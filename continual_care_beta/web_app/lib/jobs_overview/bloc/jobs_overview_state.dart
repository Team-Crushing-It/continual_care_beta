part of 'jobs_overview_bloc.dart';

/// {@template jobs_overview_state}
/// JobsOverviewState description
/// {@endtemplate}
class JobsOverviewState extends Equatable {
  /// {@macro jobs_overview_state}
  const JobsOverviewState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current JobsOverviewState with property changes
  JobsOverviewState copyWith({
    String? customProperty,
  }) {
    return JobsOverviewState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template jobs_overview_initial}
/// The initial state of JobsOverviewState
/// {@endtemplate}
class JobsOverviewInitial extends JobsOverviewState {
  /// {@macro jobs_overview_initial}
  const JobsOverviewInitial() : super();
}

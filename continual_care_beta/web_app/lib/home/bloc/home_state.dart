part of 'home_bloc.dart';

/// {@template home_state}
/// HomeState description
/// {@endtemplate}
class HomeState extends Equatable {
  /// {@macro home_state}
  const HomeState({
    this.caregivers,
  });

  /// A description for caregivers
  final List<User>? caregivers;

  @override
  List<Object?> get props => [caregivers];

  /// Creates a copy of the current HomeState with property changes
  HomeState copyWith({
    List<User>? caregivers,
  }) {
    return HomeState(
      caregivers: caregivers ?? this.caregivers,
    );
  }
}


import 'package:equatable/equatable.dart';
import 'package:turns_repository/turns_repository.dart';

abstract class TurnsState extends Equatable {
  const TurnsState();

  @override
  List<Object> get props => [];
}

class TurnsLoadInProgress extends TurnsState {}

class TurnsLoaded extends TurnsState {
  final List<Turn> turns;

  const TurnsLoaded([this.turns = const []]);

  @override
  List<Object> get props => [turns];

  @override
  String toString() {
    return 'TurnsLoaded{turns: $turns}';
  }
}

class TurnsLoadError extends TurnsState {}
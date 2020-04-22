import 'package:equatable/equatable.dart';
import 'package:turns_repository/turns_repository.dart';

abstract class TurnsEvent extends Equatable {
  const TurnsEvent();

  @override
  List<Object> get props => [];
}

class TurnsLoad extends TurnsEvent {}

class TurnsLoadSuccess extends TurnsEvent {
  final List<Turn> turns;

  TurnsLoadSuccess(this.turns);

  @override
  List<Object> get props => [turns];

  @override
  String toString() {
    return 'TurnsLoadSuccess{turns: $turns}';
  }
}
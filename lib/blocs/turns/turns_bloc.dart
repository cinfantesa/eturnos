import 'dart:async';
import 'package:eturnos/blocs/turns/turns_event.dart';
import 'package:eturnos/blocs/turns/turns_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turns_repository/turns_repository.dart';

class TurnsBloc extends Bloc<TurnsEvent, TurnsState> {
  final TurnRepository _turnRepository;
  StreamSubscription _turnsSubscription;

  TurnsBloc({@required TurnRepository turnRepository})
    : assert(turnRepository != null), _turnRepository = turnRepository;

  @override
  TurnsState get initialState => TurnsLoadInProgress();

  @override
  Stream<TurnsState> mapEventToState(TurnsEvent event) async*{
    if (event is TurnsLoadInProgress) {
      yield* _mapLoadTurnsToState();
    } else if (event is TurnsLoadSuccess) {
      yield* _mapUpdatedTurnsToState(event);
    }
  }

  Stream<TurnsState> _mapLoadTurnsToState() async* {
    _turnsSubscription?.cancel();
    _turnsSubscription = _turnRepository.turns()
      .listen((event) => add(TurnsLoadSuccess(event)));
  }

  Stream<TurnsState> _mapUpdatedTurnsToState(TurnsLoadSuccess event) async* {
    yield TurnsLoaded(event.turns);
  }
}
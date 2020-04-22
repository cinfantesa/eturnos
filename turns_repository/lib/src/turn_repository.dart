import 'dart:async';

import '../src/models/models.dart';

abstract class TurnRepository {
  Future<void> add(Turn turn);
  Stream<List<Turn>> turns();
}
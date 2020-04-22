import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todos_repository/turns_repository.dart';
import 'entities/entities.dart';

class FirebaseTurnRepository implements TurnRepository {
  final turnCollection = Firestore.instance.collection('turns');
  
  @override
  Future<void> add(Turn turn) {
    return turnCollection.add(turn.toEntity().toDocument());
  }

  @override
  Stream<List<Turn>> turns() {
    return turnCollection.snapshots().map((snap) {
      return snap.documents.map((e) => Turn.fromEntity(TurnEntity.fromSnapshot(e))).toList();
    });
  }

}
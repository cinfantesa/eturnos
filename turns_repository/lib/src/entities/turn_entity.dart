import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TurnEntity extends Equatable {
  final String id;
  final String type;
  final DateTime time;

  @override
  List<Object> get props => [id, type, time];

  const TurnEntity(this.id, this.type, this.time);

  @override
  String toString() {
    return 'TurnEntity{type: $type, time: $time}';
  }

  static TurnEntity fromJson(Map<String, Object> json) {
    return TurnEntity(
      json['id'] as String,
      json['type'] as String,
      json['time'] as DateTime
    );
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'type': type,
      'time': time
    };
  }

  static TurnEntity fromSnapshot(DocumentSnapshot snap) {
    return TurnEntity(
      snap.data['id'],
      snap.data['type'],
      snap.data['time']
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'type': type,
      'time': time
    };
  }
}
import 'package:meta/meta.dart';
import '../entities/entities.dart';

enum ActionType { startWorkDay, finishWorkDay }

@immutable
class Turn {
  final String id;
  final ActionType type;
  final DateTime time;

  Turn(this.id, this.type, this.time);

  Turn copyWith(String id, ActionType type, DateTime time) {
    return Turn(
      id ?? this.id,
      type ?? this.type,
      time ?? this.time
    );
  }

  TurnEntity toEntity() {
    return TurnEntity(id, type.toString(), time);
  }

  static Turn fromEntity(TurnEntity entity) {
    return Turn(
      entity.id,
      ActionType.values.firstWhere((e) => e.toString() == entity.type),
      entity.time
    );
  }

  @override
  int get hashCode => id.hashCode ^ type.hashCode ^ time.hashCode;

  @override
  bool operator ==(other) =>
    identical(this, other) ||
    other is Turn &&
      id == other.id &&
      type == other.type &&
      time == other.time;

  @override
  String toString() {
    return 'Turn{id: $id, type: $type, time: $time}';
  }
}
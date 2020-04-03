enum ActionType { startWorkDay, finishWorkDay }

class Turn {
  ActionType type;
  DateTime time;

  Turn(this.type) {
    this.time = new DateTime.now();
  }

  Turn.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        time = json['time'];

  Map<String, dynamic> toJson() => {
    'type': type,
    'time': time
  };

  bool isFinishWorkDay() => type != null && type == ActionType.finishWorkDay;
}

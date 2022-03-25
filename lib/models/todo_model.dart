class Todo {
  int? id;
  String? title;
  DateTime? startDate;
  DateTime? endDate;
  int? status;

  Todo({this.title, this.startDate, this.endDate, this.status});

  Todo.withId({this.id, this.title, this.startDate, this.endDate, this.status});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['title'] = title;
    map['startdate'] = startDate!.toIso8601String();
    map['enddate'] = endDate!.toIso8601String();
    ;
    map['status'] = status;
    return map;
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo.withId(
        id: map['id'],
        title: map['title'],
        startDate: DateTime.parse(map['startdate']),
        endDate: DateTime.parse(map['enddate']),
        status: map['status']);
  }
}

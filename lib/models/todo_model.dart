import 'dart:convert';

List<Todo> todoFromJson(String str) => List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
    Todo({
        required this.id,
        required this.title,
       required this.time,
       required this.isCompleted,
       required this.v,
       required this.description,
    });

    String id;
    String title;
    DateTime time;
    bool isCompleted;
    int v;
    String description;

    factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["_id"],
        title: json["title"],
        time: DateTime.parse(json["time"]),
        isCompleted: json["isCompleted"],
        v: json["__v"],
        description: json["description"] ,
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "time": time.toIso8601String(),
        "isCompleted": isCompleted,
        "__v": v,
        "description": description  ,
    };
}

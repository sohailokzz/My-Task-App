import 'package:flutter/material.dart';

import 'package:my_task_app/utilis.dart';

class TaskField {
  static const createdTime = 'createdTime';
}

class Task {
  DateTime createdTime = DateTime.now();
  String title;
  String id;
  String description;

  Task({
    @required this.createdTime,
    @required this.title,
    this.description = '',
    this.id,
  });

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'title': title,
        'description': description,
        'id': id,
      };

  static Task fromJson(Map<String, dynamic> json) => Task(
        createdTime: Utils.toDateTime(json['createdTime']),
        title: json['title'],
        description: json['description'],
        id: json['id'],
      );
}

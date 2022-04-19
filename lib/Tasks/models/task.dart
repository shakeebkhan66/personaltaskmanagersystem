import 'package:flutter/material.dart';

class Task {
  String title;
  String address;
  String desc;
  bool completed;

  Task({required this.title, required this.address, required this.desc, this.completed = false});

  void toggleCompleted() {
    completed = !completed;
  }
}

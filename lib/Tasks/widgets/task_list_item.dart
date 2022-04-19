import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../providers/todo_model.dart';

class TaskListItem extends StatelessWidget {
  final Task task;

  TaskListItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Checkbox(
        value: task.completed,
        onChanged: (bool? checked) {
          Provider.of<TodosModel>(context, listen: false).toggleTodo(task);
        },
      ),
      title: Text(task.title),
      subtitle: Text(task.desc),
      trailing: const Icon(Icons.arrow_circle_down, size: 25,),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 65),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Description : \t\t\t ${task.desc}",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w400
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Delete", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                Provider.of<TodosModel>(context, listen: false).deleteTodo(task);
              },
            ),
          ],
        )
      ],
    );
  }
}

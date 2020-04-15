import 'package:f_202010_todo_class/widgets/todo_dropdown.dart';
import 'package:f_202010_todo_class/model/todo.dart';
import 'package:flutter/material.dart';

class NewTodoDialog extends StatefulWidget {
  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}

class _NewTodoDialogState extends State<NewTodoDialog> {
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();
  String dropSelected = "DEFAULT";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      title: Text(
        'New todo',
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
      ),
      content: Column(children: <Widget>[
        TextField(
          controller: controllerTitle,
          decoration: InputDecoration(hintText: 'Title'),
        ),
        TextField(
          controller: controllerBody,
          decoration: InputDecoration(hintText: 'Body'),
        ),
        Flexible(
          child: TodoDropdown(
            selected: dropSelected,
            onChangedValue: (value) => setState(() {
              dropSelected = value;
            }),
          ),
        )
      ]),
      actions: <Widget>[
        FlatButton(
          child: Text('Add'),
          onPressed: () {
            if (controllerBody.text != "" || controllerTitle.text != "") {
              final todo = new Todo(
                title: controllerTitle.value.text,
                body: controllerBody.value.text,
                completed: 0,
              );
              Navigator.of(context).pop(todo);
            } else {
              Navigator.of(context).pop();
            }

            controllerTitle.clear();
            controllerBody.clear();
          },
        ),
      ],
    );
  }
}

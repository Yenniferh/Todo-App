import 'package:f_202010_todo_class/model/todo.dart';
import 'package:f_202010_todo_class/widgets/todo_dialog.dart';
import 'package:flutter/material.dart';

class HomePageTodo extends StatefulWidget {
  @override
  _HomePageTodoState createState() => _HomePageTodoState();
}

class _HomePageTodoState extends State<HomePageTodo> {
  List<Todo> todos = new List<Todo>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addTodo, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }

  Widget _list() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, posicion) {
        var element = todos[posicion];
        return Dismissible(
          direction: DismissDirection.endToStart,
          key: UniqueKey(),
          child: _item(element, posicion),
          background: Container(
            padding: EdgeInsets.only(right: 6.0),
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.red[700],
            child: Text(
              "Delete",
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
          onDismissed: (direction) => {
            setState(() {
              todos.remove(element);
            })
          },
        );
      },
    );
  }

  Widget _item(Todo element, int posicion) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
      child: Card(
        color: isComplete(element),
        child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
            isThreeLine: true,
            onTap: () => _onTap(context, element, posicion),
            title: Text('${element.title.toUpperCase()}',
                style: Theme.of(context).primaryTextTheme.headline),
            subtitle: Text(
              '${element.body}',
              style: Theme.of(context).primaryTextTheme.subhead,
            )),
      ),
    );
  }

  _addTodo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return NewTodoDialog();
      },
    );

    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }

  void _onTap(BuildContext context, Todo location, int posicion) {
    setState(() {
      if (this.todos[posicion].completed == 0) {
        this.todos[posicion].completed = 1;
      }
    });
  }

  Color isComplete(Todo todo) {
    if (todo.completed == 0) {
      return Colors.white;
    } else {
      return Colors.grey[300];
    }
  }
}

import 'package:f_202010_todo_class/model/todo.dart';
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

  /* void _addTodo() {
    setState(() {
      todos.add(new Todo(title: "itemT", body: "itemB", completed: 0));
    });
  } */
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
class NewTodoDialog extends StatefulWidget {
  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}
class _NewTodoDialogState extends State<NewTodoDialog> {
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();
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
         decoration: InputDecoration(
                     
                      hintText: 'Title'
             ),),
             TextField(
          controller: controllerBody, 
         decoration: InputDecoration(
                     
                      hintText: 'Body'
             ),),
             
             ]),
             actions: <Widget>[
          FlatButton(
            child: Text('Add'),
            onPressed: () {
              if(controllerBody!="" || controllerTitle!=""){
                  final todo = new Todo(
                title: controllerTitle.value.text,
                body: controllerBody.value.text,
                completed: 0,);
                Navigator.of(context).pop(todo);
              }else{
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
        


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lembre/app/models/todo_model.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (BuildContext _) {
        if (controller.todoList.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.todoList.hasError) {
          return Center(
            child: ElevatedButton(
              onPressed: controller.getList,
              child: Text('Error'),
            ),
          );
        } else {
          List<TodoModel> todoList = controller.todoList.data;
          return ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (BuildContext _, int index) {
              var todo = todoList[index];
              return ListTile(
                title: Text(todo.title),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    controller.delete(todo);
                  },
                ),
              );
            },
          );
        }

        // var number = controller.state;
        // return Center(
        //   child: Text(number.toString()),
        // );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: this._showDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  _showDialog({TodoModel? model}) {
    model ??= TodoModel();
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(model!.reference == null ? 'Adicionar' : 'Alterar'),
          content: TextFormField(
            initialValue: model.title,
            onChanged: (v) => model!.title = v,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'escreva...',
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Modular.to.pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.save(model!);
                Modular.to.pop();
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}

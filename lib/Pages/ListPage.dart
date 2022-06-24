import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listatarefas/models/TODO.dart';
import 'package:listatarefas/widgets/TODOListItem.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todoController = TextEditingController();

  List<TODO> todos = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: todoController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Adicione uma tarefa',
                            hintText: 'Exemplo: Limpar casa',
                          ),
                        ),
                      ),
                     SizedBox(width: 8),
                     ElevatedButton(
                        onPressed: () {
                          String text = todoController.text;
                          setState((){
                            TODO newTODO = TODO(
                              title: text,
                              dateTime: DateTime.now(),
                            );
                            todos.add(newTODO);
                          });
                          todoController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                           primary: Color(0xff0A152A),
                           fixedSize: Size(15, 15),
                           padding: EdgeInsets.zero,
                         ),
                        child: Icon(
                          Icons.add,
                          size: 25,
                        ),
                      ),
                    ],
                   ),
                  SizedBox(
                    height: 16,
                  ),
                 Flexible(
                   child: ListView(
                     shrinkWrap: true,
                     children: [
                       for(TODO todo in todos)
                         TODOListItem(
                           todo: todo,
                         ),
                     ],
                   ),
                 ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Você possui ${todos.length} tarefas pendentes',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff0A152A),
                          padding: EdgeInsets.all(14),
                        ),
                        child: Text('Limpar tudo'),
                      ),
                    ],
                 ),
               ],
             ),
           ),
         ),
      ),
    );
  }
}

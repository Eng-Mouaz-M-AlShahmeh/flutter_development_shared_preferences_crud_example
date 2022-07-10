/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_example/controllers/providers/todo.dart';
import 'package:shared_preferences_example/models/todo.dart';
import 'package:shared_preferences_example/views/screens/crud/list.dart';
import 'package:shared_preferences_example/views/widgets/buttons.dart';
import 'package:shared_preferences_example/views/widgets/text_form_fields.dart';

class CreateTodo extends StatelessWidget {
  CreateTodo({Key? key}) : super(key: key);

  final _createKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = context.read<TodoProvider>();

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Form(
            key: _createKey,
            child: Column(
              children: [
                iTextFormFieldNew(
                  context,
                  'Todo Text',
                  'Enter Todo Text',
                  Icons.title,
                  (val) => todoProvider.setTitle(val),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iTextFormFieldNew(
                  context,
                  'Todo Dsc',
                  'Enter Todo Dsc',
                  Icons.description,
                  (val) => todoProvider.setDsc(val),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                iOutlinedButton(context, _createKey, 'Add Todo', () {
                  todoProvider.addToList(TodoModel(
                      id: DateTime.now().microsecond,
                      title: todoProvider.title,
                      dsc: todoProvider.dsc));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TodoList()));
                }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

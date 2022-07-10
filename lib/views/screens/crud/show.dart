/* Developed by Eng Mouaz M. AlShahmeh */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences_example/controllers/providers/todo.dart';
import 'package:shared_preferences_example/models/todo.dart';
import 'package:shared_preferences_example/views/screens/crud/list.dart';
import 'package:shared_preferences_example/views/widgets/buttons.dart';
import 'package:shared_preferences_example/views/widgets/text_form_fields.dart';

class ShowTodo extends StatelessWidget {
  const ShowTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = context.read<TodoProvider>();

    final TextEditingController titleController =
        TextEditingController(text: todoProvider.selectedTodo!.title);
    titleController.value = titleController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: todoProvider.selectedTodo!.title!.length,
        ),
      ),
    );

    final TextEditingController dscController =
        TextEditingController(text: todoProvider.selectedTodo!.dsc);
    dscController.value = dscController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(
          offset: todoProvider.selectedTodo!.dsc!.length,
        ),
      ),
    );

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(todoProvider.selectedTodo!.title!),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              iTextFormFieldReadOnly(
                context,
                'Todo Text',
                'Enter Todo Text',
                Icons.title,
                (val) => todoProvider.selectTodo(TodoModel(
                  id: todoProvider.selectedTodo!.id,
                  title: val,
                  dsc: todoProvider.selectedTodo!.dsc,
                )),
                titleController,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              iTextFormFieldReadOnly(
                context,
                'Todo Dsc',
                'Enter Todo Dsc',
                Icons.description,
                (val) => todoProvider.selectTodo(TodoModel(
                    id: todoProvider.selectedTodo!.id,
                    title: todoProvider.selectedTodo!.title,
                    dsc: val)),
                dscController,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              iOutlinedButtonNoKey(context, 'Return To List', () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const TodoList()));
              }),
            ],
          ),
        ),
      ),
    ));
  }
}

/* Developed by: Eng Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:shared_preferences_example/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  // initialize data
  String? _title;
  String? _dsc;
  final List<TodoModel?> _listTodos = [];
  TodoModel? _selectedTodo;

  // setters
  setTitle(String val) {
    _title = val;
    notifyListeners();
  }

  setDsc(String val) {
    _dsc = val;
    notifyListeners();
  }

  selectTodo(TodoModel val) {
    _selectedTodo = val;
    notifyListeners();
  }

  addToList(TodoModel val) {
    _listTodos.add(val);
    notifyListeners();
  }

  removeFromList(int id) {
    _listTodos.removeWhere((element) => element!.id == id);
    notifyListeners();
  }

  updateList(TodoModel val) {
    _listTodos[_listTodos.indexWhere((element) => element!.id == val.id)] = val;
    notifyListeners();
  }

  // getters
  String? get title => _title;
  String? get dsc => _dsc;
  List<TodoModel?> get listTodos => _listTodos;
  TodoModel? get selectedTodo => _selectedTodo;
}

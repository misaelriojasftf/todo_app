// lib/main.dart
import 'package:demo/common/infraestructure/storage/main.dart';
import 'package:demo/todo_list/infraestructure/state/task_state.dart';
import 'package:demo/todo_list/infraestructure/storage/task_storage.dart';
import 'package:demo/todo_list/presentation/todo_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final task = TaskStorage();
  await initilizeBoxes([task]);
  runApp(MyApp(task));
}

/// [MyApp] core widget
class MyApp extends StatelessWidget {
  /// constructor
  const MyApp(this._taskStorage, {super.key});
  final TaskStorage _taskStorage;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskState(storage: _taskStorage),
      child: MaterialApp(
        title: 'To-Do List App',
        theme: ThemeData(),
        home: const TodoListScreen(),
      ),
    );
  }
}

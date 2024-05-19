import 'package:demo/todo_list/infraestructure/state/task_state.dart';
import 'package:demo/todo_list/presentation/widgets/add_task_dialog.dart';
import 'package:demo/todo_list/presentation/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [TodoListScreen] widget that draws the list of elements
class TodoListScreen extends StatelessWidget {
  /// constructor
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Consumer<TaskState>(
        builder: (context, taskState, _) {
          final tasks = taskState.tasks;
          if (tasks.isEmpty) {
            return const Center(child: Text('Nothing to show...'));
          }

          final incompleteTasks =
              tasks.where((task) => !task.isCompleted).toList();
          final completedTasks =
              tasks.where((task) => task.isCompleted).toList();

          return ListView.builder(
            itemCount: incompleteTasks.length + completedTasks.length,
            itemBuilder: (context, index) {
              if (index < incompleteTasks.length) {
                return TaskItem(task: incompleteTasks[index]);
              }
              final completedIndex = index - incompleteTasks.length;
              final task = completedTasks[completedIndex];
              return TaskItem(
                task: task,
                // Adjust animation delay as needed
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<void>(
          context: context,
          builder: (context) => const AddDialog(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

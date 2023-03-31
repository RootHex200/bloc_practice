import 'package:bloc_statemanagement/controller/todocontroller/todo_bloc.dart';
import 'package:bloc_statemanagement/controller/todocontroller/todo_event_bloc.dart';
import 'package:bloc_statemanagement/controller/todocontroller/todo_state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return state is TodoDataLoaded
              ? ListView.builder(
                  itemCount: state.todoData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.todoData[index]),
                      trailing: IconButton(
                          onPressed: () {
                            context
                                .read<TodoBloc>()
                                .add(DeleteTodoData(index: index));
                          },
                          icon: const Icon(Icons.delete)),
                    // leading: IconButton(
                    //       onPressed: () {
                    //         context
                    //             .read<TodoBloc>()
                    //             .add(UpdateTodoData(index: index, todoData: state.todoData[index]));
                    //       },
                    //       icon: const Icon(Icons.create_rounded)),
                    );
                  })
              : Container();
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content:  TextField(
                    controller: _controller,
                    ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("cancel")),
                  TextButton(
                      onPressed: () {

                        context
                            .read<TodoBloc>()
                            .add(AddTodoData(todoData:_controller.text));
                        Navigator.pop(context);
                      },
                      child: const Text("Add"))
                ],
              );
            });
      }),
    );
  }
}

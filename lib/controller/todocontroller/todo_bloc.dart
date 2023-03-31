import 'package:bloc_statemanagement/controller/todocontroller/todo_event_bloc.dart';
import 'package:bloc_statemanagement/controller/todocontroller/todo_state_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoDataLoaded(["sabitur", "rahman", "farhan"])) {
    on<AddTodoData>((event, emit) {
      final state = this.state;
      List<String> data =
          List.from(state is TodoDataLoaded ? state.todoData : []);
      data[0] = event.todoData;
      emit(TodoDataLoaded(data));
      print(data);
    });

    on<DeleteTodoData>((event, emit) {
      final state = this.state;
      List<String> data =
          List.from(state is TodoDataLoaded ? state.todoData : []);
      data.removeAt(event.index);
      emit(TodoDataLoaded(data));
      print(data);
    });
  }
}

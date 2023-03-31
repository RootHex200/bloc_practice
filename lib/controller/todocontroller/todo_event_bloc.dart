import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddTodoData extends TodoEvent {
  final String todoData;
  const AddTodoData({required this.todoData});
  @override
  List<Object> get props => [];
}

class UpdateTodoData extends TodoEvent {
  final int index;
  final String todoData;
  UpdateTodoData({required this.index,required this.todoData});
  @override
  List<Object?> get props => [index];
}

class DeleteTodoData extends TodoEvent {
  final int index;
  DeleteTodoData({required this.index});
  @override
  List<Object?> get props => [];
}

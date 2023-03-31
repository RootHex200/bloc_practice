
import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable{
  const TodoState();
}
class TodoDataLoaded extends TodoState {
  final List<String> todoData;
  const TodoDataLoaded(this.todoData);
  @override
  List<Object> get props => [todoData];
}
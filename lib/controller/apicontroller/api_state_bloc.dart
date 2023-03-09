

import 'package:bloc_statemanagement/model/post_model.dart';
import 'package:equatable/equatable.dart';

abstract class ApiState extends Equatable{
  const ApiState();
  @override
  List<Object> get props => [];
}

class ApiInitialState extends ApiState{
  @override
  List<Object> get props => [];
}


class ApiLoadingState extends ApiState{
  const ApiLoadingState();
  @override
  List<Object> get props => [];
}

class ApiLoadedState extends ApiState{
  final List<PostModel> postList;
  const ApiLoadedState({required this.postList});
  @override
  List<Object> get props => [postList];
}

class ApiErrorState extends ApiState{
  final String message;
  const ApiErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

class ApiDataNoMore extends ApiState{
  const ApiDataNoMore();
  @override
  List<Object> get props => [];
}
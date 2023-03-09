

import 'package:bloc_statemanagement/model/post_model.dart';
import 'package:equatable/equatable.dart';

abstract class ApiEvent extends Equatable{
  const ApiEvent();
  @override
  List<Object> get props => [];
}

class FetchApiData extends ApiEvent{
  final int page;
  const FetchApiData({required this.page});
  @override
  List<Object> get props => [];
}
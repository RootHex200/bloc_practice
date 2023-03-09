import 'dart:math';

import 'package:bloc_statemanagement/controller/apicontroller/api_event_bloc.dart';
import 'package:bloc_statemanagement/controller/apicontroller/api_state_bloc.dart';
import 'package:bloc_statemanagement/model/post_model.dart';
import 'package:bloc_statemanagement/service/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitialState()) {
    on<FetchApiData>((event, emit) async {
      emit(const ApiLoadingState());
      try {
        List<PostModel> postList = await ApiService().getPost(event.page);
        if (postList.length < 20) {
          emit(const ApiDataNoMore());
          print("data is done");
        }
        emit(ApiLoadedState(postList: postList));
      } catch (e) {
        emit(ApiErrorState(message: e.toString()));
      }
    });
  }
}

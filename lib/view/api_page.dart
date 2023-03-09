//https://jsonplaceholder.typicode.com/posts?_start=0&_limit=5

import 'package:bloc_statemanagement/controller/apicontroller/api_bloc.dart';
import 'package:bloc_statemanagement/controller/apicontroller/api_event_bloc.dart';
import 'package:bloc_statemanagement/controller/apicontroller/api_state_bloc.dart';
import 'package:bloc_statemanagement/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);
  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  late final ScrollController scrollController;
  bool isLoading = true;
  List<PostModel> postList = [];
  void onScroll() {
    if (!scrollController.hasClients) return;
    if (scrollController.offset == scrollController.position.maxScrollExtent) {
      print(postList.length);
      context.read<ApiBloc>().add(FetchApiData(page: postList.length));
    }
  }

  @override
  void initState() {
    scrollController = ScrollController()..addListener(onScroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Api Page"),
        ),
        body: BlocConsumer<ApiBloc, ApiState>(
          listener: (context, state) {
            if (state is ApiErrorState) {
              Center(child: Text(state.message));
            }
            if (state is ApiDataNoMore) {
              //snackbar
              isLoading = false;
            }
          },
          builder: (context, state) {
            if (state is ApiLoadedState) {
              postList.addAll(state.postList);
              print("data is here");
            }
            return postList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    controller: scrollController,
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: postList.length + 1,
                    itemBuilder: (context, index) {
                      return index < postList.length
                          ? Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(postList[index].id.toString()),
                                  Text(postList[index].title.toString()),
                                ],
                              ),
                            )
                          : Center(
                              child: isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text("No more data"),
                            );
                    },
                  );
          },
        ));
  }
}

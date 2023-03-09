import 'package:bloc_statemanagement/controller/apicontroller/api_bloc.dart';
import 'package:bloc_statemanagement/view/api_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/apicontroller/api_event_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApiBloc>(
          create: (context) => ApiBloc()..add(const FetchApiData(page: 0)),
        ),
      ],
      child:const MaterialApp(home: ApiPage()),
    );
  }
}

import 'package:bloc_counter/Screen/in_de_screen.dart';
import 'package:bloc_counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: "Bloc Counter App",
        theme: ThemeData(
          appBarTheme: const AppBarTheme().copyWith(color: Colors.pink),
        ),
        home: const IncrementDecrement(),
      ),
    );
  }
}

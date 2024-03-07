import 'package:cubit_to_cubit_communication_using_streamsubscription/business_layer/color_cubit/color_cubit.dart';
import 'package:cubit_to_cubit_communication_using_streamsubscription/business_layer/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ColorCubit>(
            create: (context) => ColorCubit(),
          ),
          BlocProvider<CounterCubit>(
            create: (context) => CounterCubit(
              colorCubit: context.read<ColorCubit>(),
            ),
          )
        ],
        child: MaterialApp(
          title: "cubit2cubit",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorCubit>().state.color,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<ColorCubit>().changeColor();
            },
            child: const Text('Change Color'),
          ),
          const SizedBox(
            height: 20,
          ),
          Text('${context.watch<CounterCubit>().state.counter}'),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterCubit>().changeCounter();
            },
            child: const Text("Increment Button"),
          ),
        ],
      ),
    );
  }
}

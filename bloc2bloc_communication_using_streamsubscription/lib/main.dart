import 'package:bloc2bloc_communication_using_streamsubscription/Bussines_Layer/color/color_bloc.dart';
import 'package:bloc2bloc_communication_using_streamsubscription/Bussines_Layer/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) =>
              CounterBloc(colorbloc: BlocProvider.of<ColorBloc>(context)),
        ),
        BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(),
        )
      ],
      child: MaterialApp(
        title: "Bloc2Bloc",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.read<ColorBloc>().state.color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  context.read<ColorBloc>().add(ChangeColorEvent()),
              child: const Text("Change Color"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('${BlocProvider.of<CounterBloc>(context).state.counter}')
          ],
        ),
      ),
    );
  }
}

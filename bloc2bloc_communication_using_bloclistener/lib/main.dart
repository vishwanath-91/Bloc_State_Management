import 'package:bloc2bloc_communication_using_bloclistener/Bussines_Layer/color/color_bloc.dart';
import 'package:bloc2bloc_communication_using_bloclistener/Bussines_Layer/counter/counter_bloc.dart';
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
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(),
        )
      ],
      child: MaterialApp(
        title: "bloc2bloc bloclistener",
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
  int incrementSize = 1;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorBloc, ColorState>(
      listener: (context, state) {
        if (ColorState.initial().color == Colors.red) {
          incrementSize = 1;
        } else if (ColorState.initial().color == Colors.green) {
          incrementSize = 10;
        } else if (ColorState.initial().color == Colors.blue) {
          incrementSize = 100;
        } else if (ColorState.initial().color == Colors.black) {
          incrementSize = -100;
          BlocProvider.of<CounterBloc>(context)
              .add(ChangeCounterEvent(incrementSize + incrementSize));
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorBloc>().state.color,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<ColorBloc>().add(ChangeColorEvent());
                },
                child: const Text("Change Color"),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('${context.watch<CounterBloc>().state.counter}'),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<CounterBloc>()
                        .add(ChangeCounterEvent(incrementSize));
                  },
                  child: const Text('Increment Counter'))
            ],
          ),
        ),
      ),
    );
  }
}

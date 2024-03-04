import 'package:bloc_counter/Screen/other_screen.dart';
import 'package:bloc_counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementDecrement extends StatefulWidget {
  const IncrementDecrement({super.key});

  @override
  State<IncrementDecrement> createState() => _IncrementDecrementState();
}

class _IncrementDecrementState extends State<IncrementDecrement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Increment Decrement"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<CounterBloc, CounterState>(
                builder: (context, state) => Text(
                    '${BlocProvider.of<CounterBloc>(context).state.counter}'),
                listener: (context, state) {
                  if (state.counter == 1) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Text("counter is ${state.counter}"),
                      ),
                    );
                  } else if (state.counter == 3) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OtherScreen(),
                        ));
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(IncrementCounterEvent());
                    },
                    child: const Text("Increment"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(DecrementCounterEvent());
                    },
                    child: const Text("Decrement"),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

// ShowMeCounter.dart
// ...

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:named_route_access_using_bloc/cubit/counter_cubit.dart';

class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Me Counter"),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text('${state.counter}');
              },
            ),
          ],
        ),
      ),
    );
  }
}

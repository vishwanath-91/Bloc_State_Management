import 'package:connectionn_app/bloc/connection_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ConnectionBloc>().add(InternetLoastEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectionBloc, ConnectionState>(
      builder: (context, state) {
        if (state is ConnectionGaindState) {
          return const Center(
            child: Text('Connected'),
          );
        } else if (state is ConnectionLoastState) {
          return const Center(
            child: Text('Not Connected'),
          );
        } else {
          return const SizedBox();
        }
      },
      listener: (context, state) {},
    );
  }
}

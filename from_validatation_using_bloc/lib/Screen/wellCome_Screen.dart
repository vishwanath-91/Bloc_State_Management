import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:from_validatation_using_bloc/Bloc/sigin_bloc.dart';
import 'package:from_validatation_using_bloc/Screen/sigin_screen.dart';

class WellComeScreen extends StatefulWidget {
  const WellComeScreen({super.key});

  @override
  State<WellComeScreen> createState() => _WellComeScreenState();
}

class _WellComeScreenState extends State<WellComeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => SiginBloc(),
                  child: const SiginScreen(),
                ),
              ));
            },
            child: const Text("SignInScreen"),
          )
        ],
      ),
    );
  }
}

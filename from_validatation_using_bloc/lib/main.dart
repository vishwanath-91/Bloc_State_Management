import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:from_validatation_using_bloc/Bloc/sigin_bloc.dart';
import 'package:from_validatation_using_bloc/Screen/wellCome_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SiginBloc(),
      child: MaterialApp(
        title: "form Validation",
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          appBarTheme: const AppBarTheme()
              .copyWith(color: const Color.fromARGB(255, 107, 54, 72)),
        ),
        home: const Scaffold(
          body: WellComeScreen(),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_setting_using_cubit/cubit/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: "Theme setting using cubit",
              debugShowCheckedModeBanner: false,
              theme: state.appTheme == AppTheme.light
                  ? ThemeData.light()
                  : ThemeData.dark(),
              home: const MyHomePage(),
            );
          },
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final int randInt = Random().nextInt(10);
            BlocProvider.of<ThemeCubit>(context).changeTheme(randInt);
          },
          child: const Text("Change Theme"),
        ),
      ),
    );
  }
}

import 'package:cubit_api_project/Repo/user_repo.dart';
import 'package:cubit_api_project/Screens/home_screen.dart';
import 'package:cubit_api_project/cubit/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => UserRepoData(),
      )
    ],
    child: const MyApp(),
  ));
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
        BlocProvider(
          create: (context) => UserCubit(
            UserRepoData(),
          ),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme().copyWith(
              color: const Color.fromARGB(187, 130, 10, 130),
            ),
            textTheme: const TextTheme().copyWith(
              titleMedium: const TextStyle(color: Colors.white),
            ),
          ),
          home: const HomeScreen()),
    );
  }
}

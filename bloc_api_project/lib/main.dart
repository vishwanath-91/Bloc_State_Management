import 'package:bloc_api_project/BlocObserver/blocObserver.dart';
import 'package:bloc_api_project/Screens/home_screen.dart';
import 'package:bloc_api_project/repo_data/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc_Provider/api_project_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    RepositoryProvider(
      create: (BuildContext context) => ProductsRepo(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiProjectBloc(
        ProductsRepo(),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme().copyWith(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Click For Loading Product'),
      ),
      body: const HomeScreen(),
    );
  }
}

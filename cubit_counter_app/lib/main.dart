import 'package:cubit_counter_app/cubit/cart_count_cubit.dart';
import 'package:cubit_counter_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCountCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Cart Counter App",
        theme: ThemeData(
          appBarTheme: const AppBarTheme().copyWith(
            color: Colors.red[300],
          ),
        ),
        home: const Scaffold(
          body: CartScreen(),
        ),
      ),
    );
  }
}

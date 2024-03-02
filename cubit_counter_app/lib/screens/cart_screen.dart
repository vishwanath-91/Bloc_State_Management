import 'package:cubit_counter_app/cubit/cart_count_cubit.dart';
import 'package:cubit_counter_app/screens/cart_checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Screen"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartCheckOutScreen(),
                    ));
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CartCountCubit, CartCountState>(
              builder: (context, state) {
                return Text(
                  state.cartItemCount.toString(),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CartCountCubit>(context).increment();
                  },
                  child: const Text("Increment"),
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CartCountCubit>().decrement();
                  },
                  child: const Text("Decrement"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

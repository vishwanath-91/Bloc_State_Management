import 'package:cubit_api_project/cubit/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().onLoadUserDaata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Data"),
      ),
      body: BlocConsumer<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            return const Center(
              child: Text('waiting...'),
            );
          } else if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is UserLoadedState) {
            return ListView.separated(
              itemBuilder: (context, index) {
                final data = state.usermodel[index];
                return Text(data.email); // Add 'return' here
              },
              separatorBuilder: (context, index) => Builder(builder: (context) {
                return const Divider(
                  height: 20,
                  color: Colors.black87,
                );
              }),
              itemCount: state.usermodel.length,
            );
          } else if (state is UserErrorState) {
            // Handle error state if needed
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const SizedBox();
          }
        },
        listener: (context, state) {
          // You can add any necessary listener logic here
          if (state is UserLoadingState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Data loading..."),
              ),
            );
          } else if (state is UserLoadedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Data loaded"),
              ),
            );
          } else if (state is UserErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("shomething went wrong")));
          }
        },
      ),
    );
  }
}

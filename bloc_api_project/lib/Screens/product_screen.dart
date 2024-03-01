import 'package:bloc_api_project/Bloc_Provider/api_project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ApiProjectBloc>().add(ApiProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Screen'),
        ),
        body: BlocConsumer<ApiProjectBloc, ApiProjectState>(
          builder: (context, state) {
            if (state is ApiProjectInitial) {
              return const Center(
                child: Text('Waiting...'),
              );
            } else if (state is ApiProductsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ApiProductsLoadedState) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      state.data[index].category.toString(),
                    ),
                  );
                },
              );
            } else if (state is ApiProductsErrorState) {
              return const Center(child: Text('Something Went Wrong'));
            } else {
              return const SizedBox();
            }
          },
          listener: (context, state) {
            if (state is ApiProductsLoadedState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Data Loaded")));
            } else if (state is ApiProductsErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data not loaded')));
            }
          },
        ));
  }
}

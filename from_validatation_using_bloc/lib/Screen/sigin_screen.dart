import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:from_validatation_using_bloc/Bloc/sigin_bloc.dart';

class SiginScreen extends StatefulWidget {
  const SiginScreen({super.key});

  @override
  State<SiginScreen> createState() => _SiginScreenState();
}

class _SiginScreenState extends State<SiginScreen> {
  TextEditingController emailValue = TextEditingController();
  TextEditingController passWordValue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In With Email"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              BlocBuilder<SiginBloc, SiginState>(
                builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(state.errorMessage);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              TextField(
                controller: emailValue,
                onChanged: (value) {
                  BlocProvider.of<SiginBloc>(context).add(
                    SignInTextChangedEvent(
                        emailValue: emailValue.text,
                        passWordValue: passWordValue.text),
                  );
                },
                decoration: const InputDecoration(hintText: "Email Address"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passWordValue,
                onChanged: (value) {
                  BlocProvider.of<SiginBloc>(context).add(
                    SignInTextChangedEvent(
                        emailValue: emailValue.text,
                        passWordValue: passWordValue.text),
                  );
                },
                decoration: const InputDecoration(hintText: "Password"),
              ),
              BlocBuilder<SiginBloc, SiginState>(builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<SiginBloc>(context).add(
                      SignInSubmittedEvent(
                          emailValue: emailValue.text,
                          passwordValue: passWordValue.text),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      (state is SignInValidState) ? Colors.blue : Colors.grey,
                    ),
                  ),
                  child: (state is SignInLoadingState == false)
                      ? const Text("submit")
                      : const CircularProgressIndicator.adaptive(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

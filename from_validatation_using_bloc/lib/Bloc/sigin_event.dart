part of 'sigin_bloc.dart';

sealed class SiginEvent extends Equatable {
  const SiginEvent();

  @override
  List<Object> get props => [];
}

class SignInTextChangedEvent extends SiginEvent {
  final String emailValue;
  final String passWordValue;

  const SignInTextChangedEvent(
      {required this.emailValue, required this.passWordValue});
}

class SignInSubmittedEvent extends SiginEvent {
  final String emailValue;
  final String passwordValue;

  const SignInSubmittedEvent(
      {required this.emailValue, required this.passwordValue});
}

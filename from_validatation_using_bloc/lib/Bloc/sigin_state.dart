part of 'sigin_bloc.dart';

class SiginState extends Equatable {
  const SiginState();

  @override
  List<Object> get props => [];
}

class SiginInitialState extends SiginState {}

class SignInValidState extends SiginState {}

class SignInErrorState extends SiginState {
  final String errorMessage;

  const SignInErrorState({required this.errorMessage});
}

class SignInLoadingState extends SiginState {}

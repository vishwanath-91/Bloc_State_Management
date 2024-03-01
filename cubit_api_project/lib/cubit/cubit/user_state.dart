part of 'user_cubit.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<UserModel> usermodel;
  const UserLoadedState(this.usermodel);
  @override
  List<Object> get props => [usermodel];
}

class UserErrorState extends UserState {
  final String errorMessage;
  const UserErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

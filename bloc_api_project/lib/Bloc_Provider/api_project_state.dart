part of 'api_project_bloc.dart';

abstract class ApiProjectState extends Equatable {
  const ApiProjectState();

  @override
  List<Object> get props => [];
}

class ApiProjectInitial extends ApiProjectState {
  const ApiProjectInitial();

  @override
  List<Object> get props => [];
}

class ApiProductsLoadingState extends ApiProjectState {
  @override
  List<Object> get props => [];
}

class ApiProductsLoadedState extends ApiProjectState {
  final List<Product> data;

  const ApiProductsLoadedState(this.data);

  @override
  List<Object> get props => [data];
}

class ApiProductsErrorState extends ApiProjectState {
  final String errorMessage;

  const ApiProductsErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

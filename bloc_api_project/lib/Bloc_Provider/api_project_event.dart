part of 'api_project_bloc.dart';

abstract class ApiProjectEvent extends Equatable {
  const ApiProjectEvent();

  @override
  List<Object> get props => [];
}

class ApiProductsLoadedEvent extends ApiProjectEvent {
  @override
  List<Object> get props => [];
}

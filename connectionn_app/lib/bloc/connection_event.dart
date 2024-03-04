part of 'connection_bloc.dart';

class ConnectionEvent extends Equatable {
  const ConnectionEvent();

  @override
  List<Object> get props => [];
}

class InternetLoastEvent extends ConnectionEvent {}

class InternetGainedEvent extends ConnectionEvent {}

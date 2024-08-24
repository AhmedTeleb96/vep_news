import 'package:equatable/equatable.dart';

abstract class MyBlocState extends Equatable {
  const MyBlocState();

  @override
  List<Object> get props => [];
}

class MyStateInitial extends MyBlocState {}

class MyStateLoading extends MyBlocState {}

class MyStateLoaded extends MyBlocState {
  final String data;

  MyStateLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class MyStateError extends MyBlocState {
  final String error;

  MyStateError({required this.error});

  @override
  List<Object> get props => [error];
}

import 'package:equatable/equatable.dart';
import 'package:techpro/Data/Model.dart';

abstract class BlocState extends Equatable {}

class InitialState extends BlocState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends BlocState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends BlocState {

  List<About> about;

  LoadedState({required this.about});

  @override
  // TODO: implement props
  List<Object> get props => [about];
}

class ErrorState extends BlocState {

  String message;

  ErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
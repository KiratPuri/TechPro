import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techpro/Data/Model.dart';
import 'package:techpro/Data/Repo.dart';
import 'Event.dart';
import 'State.dart';

class CoursesBloc extends Bloc<Event, BlocState> {

  RepositoryImpl repository;
  late List<About> about;

  CoursesBloc({required this.repository}) : super(InitialState());

  @override
  // TODO: implement initialState
  BlocState get initialState => InitialState();

  @override
  Stream<BlocState> mapEventToState(Event event) async* {
    if(event is InitialState){
      print("Bloc Started..................................");
    }
    if (event is FetchEvent) {
      yield LoadingState();
      about = await repository.getAbout();
      print("//////////////////////////////////////////////");
      print(about.length);
      yield LoadedState(about: about);
    }
  }
}

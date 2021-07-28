import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:techpro/Bloc/Bolc.dart';
import 'package:techpro/Bloc/Event.dart';
import 'package:techpro/Bloc/State.dart';
import 'Bloc/AuthBloc.dart';
import 'Data/Repo.dart';
import 'main.dart';

class Presentation extends StatefulWidget {
  const Presentation({Key? key}) : super(key: key);
  @override
  _PresentationState createState() => _PresentationState();
}

class _PresentationState extends State<Presentation> {

  ScrollController control = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CoursesBloc>(context).add(FetchEvent());
    super.initState();
  }

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: (){
                BlocProvider.of<CoursesBloc>(context).add(FetchEvent());
              },
              icon: Icon(Icons.refresh),
            ),
            TextButton(
                onPressed: (){
                  Provider.of<AuthBloc>(context).loginGoogle().logout();
                },
                child: Text("Logout", style: TextStyle(color: Colors.black),))
          ],
        ),
        body: BlocBuilder<CoursesBloc, BlocState>(
          builder: (context, state) {
            return BlocProvider.of<CoursesBloc>(context).state is LoadingState || BlocProvider.of<CoursesBloc>(context).state is InitialState ?
            Center(child: CircularProgressIndicator(color: Colors.black,strokeWidth: 10,))
                :
            Center(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                controller: control,
                itemCount: BlocProvider.of<CoursesBloc>(context).about.length,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: width,
                      color: Colors.black54,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(BlocProvider.of<CoursesBloc>(context).about[index].name, overflow: TextOverflow.ellipsis , style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
                          Text(BlocProvider.of<CoursesBloc>(context).about[index].email, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
                          Text(BlocProvider.of<CoursesBloc>(context).about[index].id.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        )
    );
  }
}

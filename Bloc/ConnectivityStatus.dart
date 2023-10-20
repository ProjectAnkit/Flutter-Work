//States

abstract class Internetstate{}

class Internetinitialstate extends Internetstate{}

class Internetloststate extends Internetstate{}

class Internetgainedstate extends Internetstate{}



//Events

abstract class Internetevent{}

class Internetlostevent extends Internetevent{}

class Internetgainedevent extends Internetevent{}



//InternetBloc

import 'dart:async';
import 'package:blocapp/bloc/Internet_events.dart';
import 'package:blocapp/bloc/Internet_states.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Internetbloc extends Bloc<Internetevent,Internetstate>{
    final Connectivity _connectivity = Connectivity();
     StreamSubscription? streamSubscription;

     Internetbloc() : super(Internetinitialstate()){  

     on<Internetgainedevent>((event,emit) => emit(Internetgainedstate()));
     on<Internetlostevent>(((event, emit) => emit(Internetloststate())));

     streamSubscription =  _connectivity.onConnectivityChanged.listen((event) {

      if(event == ConnectivityResult.mobile || event == ConnectivityResult.wifi){
        add(Internetgainedevent());
      }

      else{
        add(Internetlostevent());
      }
      });

  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}





//MainPage

import 'package:blocapp/HomePage.dart';
import 'package:blocapp/bloc/Internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainPage());
}


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> Internetbloc(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}



//HomePage

import 'package:blocapp/bloc/Internet_bloc.dart';
import 'package:blocapp/bloc/Internet_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocConsumer<Internetbloc, Internetstate>(
              builder: (context, state){
                   if(state is Internetgainedstate)
                   {
                     return const Text("Connected");
                   }
                   else if(state is Internetloststate){
                    return const Text("Not connected");
                   }
                   else{
                    return const Text("No signal");
                   }

              }, 
              listener: (context,listen){
                if(listen is Internetgainedstate)
                {
                   ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Connected"),
                      backgroundColor: Colors.teal,
                    )
                   );
                }

                else if(listen is Internetloststate){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Not connected"),
                      backgroundColor: Colors.red,
                    )
                   );
                }

                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("No signal"),
                      backgroundColor: Colors.grey,
                    )
                   );

                }

              }),
          )
        ],
      ),
    );
  }
}

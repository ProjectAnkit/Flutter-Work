import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewScreen extends StatelessWidget {
  NewScreen({super.key});

  ValueNotifier<int>_counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    log("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless to Stateful"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Center(
              child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                return Text(_counter.value.toString(),style: TextStyle(fontSize: 40),);
              },)
            )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
        onPressed: (){

          _counter.value++;

      }),
    );
  }
}

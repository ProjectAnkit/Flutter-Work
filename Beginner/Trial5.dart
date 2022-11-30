import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: MyScaffold(),
  ));
}

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override

  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  @override

    int count = 0;

    void increment()
    {
      setState(() {
        count++;
      });
    }

  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterIncrement(onPressed: increment),
            SizedBox(width: 20,),
            CounterDisplay(counter: count,),
          ],
        ),
      )
    );
  }
}

class CounterIncrement extends StatelessWidget {
  const CounterIncrement({super.key, required this.onPressed});

   final VoidCallback onPressed;

  @override

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text("Increment"),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key, required this.counter});

  final int counter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text("Count : $counter"),
    );
  }
}

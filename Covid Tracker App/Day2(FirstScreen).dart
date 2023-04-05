import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Nextpage extends StatefulWidget {
  const Nextpage({super.key});

  @override
  State<Nextpage> createState() => _NextpageState();
}

class _NextpageState extends State<Nextpage> with TickerProviderStateMixin{

   late final AnimationController _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 3));

  @override
  void dispose(){
   super.dispose();

   _animationController.dispose();
  }

  final List<Color> _colorlist = [
    Colors.cyanAccent,
    Colors.amberAccent,
    Colors.deepPurpleAccent
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(backgroundColor: Colors.black,),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: PieChart( 
                dataMap: const {
                  'Total': 20,
                  'Max':35,
                  'Min':5,
                },
                colorList: _colorlist,
                animationDuration: const Duration(milliseconds: 1000),
                chartType: ChartType.ring,
                legendOptions: const LegendOptions(legendPosition: LegendPosition.left,legendTextStyle: TextStyle(color: Colors.white)),
                chartRadius: MediaQuery.of(context).size.width * 0.5,
                ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.black54,
                 child: Column(
                  children: const [
                       ReusableRow(Name: "Total", Value: "2000"),
                       ReusableRow(Name: "Maximum", Value: "1400"),
                       ReusableRow(Name: "Minimum", Value: "1000"),
                       ReusableRow(Name: "Remaining", Value: "500"),
                  ],
                 ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                height: 50,
                width: 365,
                decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(5)),
                child: const Center(child: Text("Track Countries",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  const ReusableRow({super.key, required this.Name, required this.Value});

 final String Name,Value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text(Name,style: const TextStyle(color: Colors.white,fontSize: 15),),
                  Text(Value,style: const TextStyle(color: Colors.white,fontSize: 15),),
              ],
            ),
          ),
          const Divider(color: Color.fromARGB(255, 74, 73, 73),),
        ],
      ),
    );
  }
}

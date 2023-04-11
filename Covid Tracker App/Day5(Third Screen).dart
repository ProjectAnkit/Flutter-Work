//Country Data Page
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Api/getdata.dart';
import 'package:flutter_application_1/HomePage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CountryData extends StatefulWidget {
  final int index;
  const CountryData(this.index, {super.key});
  

  @override
  State<CountryData> createState() => _CountryDataState();
}

class _CountryDataState extends State<CountryData> with TickerProviderStateMixin{
   late AnimationController _animationController;
   late BuildContext _context;
   late Timer _timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 2));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Update the display every second
    });
  }


  @override
  void dispose(){
    _timer.cancel();
   super.dispose();
    
   _animationController.dispose();
   
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _context = context;
  }
  
  Widget build(BuildContext context) {
    GetCountriesApi getCountriesApi = GetCountriesApi();
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(backgroundColor: Colors.black,),
      body: SafeArea(
        child: FutureBuilder(
          future: getCountriesApi.CountriesApi(),
          builder: ((context, AsyncSnapshot <List<dynamic>> snapshot) {
            if(!snapshot.hasData)
            {
              return const Expanded(
                child: Center(
                  child: SpinKitPumpingHeart(
                    color: Colors.white,
                  ),
                ));
            }
            else{
              return Stack(
                children: [
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.black45),
                          child: Column(
                            children: [
                              ReusableRow(Name: "Total Cases", Value: snapshot.data![widget.index]['cases'].toString()),
                              ReusableRow(Name: "Today Cases", Value: snapshot.data![widget.index]['todayCases'].toString()),
                              ReusableRow(Name: "Deaths", Value: snapshot.data![widget.index]['deaths'].toString()),
                              ReusableRow(Name: "Total Recovered", Value: snapshot.data![widget.index]['recovered'].toString()),
                              ReusableRow(Name: "Active Cases", Value: snapshot.data![widget.index]['active'].toString()),
                            ],
                          ),
                        ),
                      ),   
                  ],
                ),
                 Positioned(
                        bottom: 460,
                        left: 161,
                        right: 161,
                         child: Container( 
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(45),image: DecorationImage(image: NetworkImage(snapshot.data![widget.index]['countryInfo']['flag']),fit: BoxFit.cover)),
                          ),
                       )
                ]
              );
            }
          }),
        ),
      )
    );
  }
}

//Updated Second Screen

import 'package:flutter/material.dart';
import 'package:flutter_application_1/CountryList%20Page/Countrytile.dart';
import 'package:flutter_application_1/Models/CovidModel.dart';
import 'package:flutter_application_1/Api/getdata.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Countrydata.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> with TickerProviderStateMixin{
 
   late final AnimationController _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 3));

   TextEditingController _controller = TextEditingController();

  @override
  void dispose(){
   super.dispose();

   _animationController.dispose();
   
  }
  
  Widget build(BuildContext context) {
   GetCountriesApi getCountriesApi = GetCountriesApi();
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(backgroundColor: Colors.black,),
      body: SafeArea(
        child: FutureBuilder(
          future: getCountriesApi.CountriesApi(),
          builder: ((context,AsyncSnapshot <List<dynamic>> snapshot) {
            if(!snapshot.hasData)
            {
              return Expanded(
                child: Center(
                  child: SpinKitPumpingHeart(
                    color: Colors.white,
                     controller: _animationController,
                  ),
                ));
            }
            else{
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      height: 60,
                      width: 360,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: Color.fromARGB(255, 81, 80, 80)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 16),
                        child: TextFormField(
                          controller: _controller,
                          onChanged: (value) {
                            setState(() {
                              
                            });
                          },
                           decoration: InputDecoration(border: InputBorder.none,hintText: "Search Country",hintStyle: TextStyle(color: Color.fromARGB(163, 255, 255, 255))),
                           style: TextStyle(color: Colors.white),
                        ),
                      )),
                  ),
                  Expanded(
                    child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      
                      String name = snapshot.data![index]['country'].toString();
                      if(_controller.text.isEmpty)
                      {
                        return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => CountryData(index))));
                        },
                        child: Countrytile(
                          Active: snapshot.data![index]['active'].toString(),
                           Name: snapshot.data![index]['country'].toString(),
                          flag: NetworkImage(snapshot.data![index]['countryInfo']['flag'].toString()),
                        ),
                      );
                      }
                      else if(name.toLowerCase().contains(_controller.text.toLowerCase())){
                        return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => CountryData(index))));
                        },
                        child: Countrytile(
                          Active: snapshot.data![index]['active'].toString(),
                           Name: snapshot.data![index]['country'].toString(),
                          flag: NetworkImage(snapshot.data![index]['countryInfo']['flag'].toString()),
                        ),
                      );
                      }
                      else
                      {
                        return Container();
                      }
                    })
                    ),
                  ),
                ],
              );
            }
          })),
      ),
    );
  }
}

//FirstPage

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Countrieslist.dart';
import 'package:flutter_application_1/Models/CovidModel.dart';
import 'package:flutter_application_1/Models/getdata.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    GetcovidApi getcovidApi = GetcovidApi();
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(backgroundColor: Colors.black,),
      body: SafeArea(
        child: FutureBuilder(
          future: getcovidApi.GetApi(),
          builder: ((context, AsyncSnapshot<AllcountriesModel>snapshot) {
            
            if(!snapshot.hasData)
            {
              return Expanded(
                child: SpinKitFadingCircle(
                  color: Colors.white,
                  controller: _animationController,
                ));
            }
            else{
              return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: PieChart( 
                dataMap:  {
                  'Cases': double.parse(snapshot.data!.cases.toString()),
                  'Death': double.parse(snapshot.data!.deaths.toString()),
                  'Recovered': double.parse(snapshot.data!.recovered.toString()),
                },
                chartValuesOptions: const ChartValuesOptions(showChartValuesInPercentage: true),
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
                  children:  [
                       ReusableRow(Name: "Total cases", Value: snapshot.data!.cases.toString()),
                       ReusableRow(Name: "Total Recovered", Value: snapshot.data!.recovered.toString()),
                       ReusableRow(Name: "Total Deaths", Value: snapshot.data!.deaths.toString()),
                       ReusableRow(Name: "Active", Value: snapshot.data!.active.toString()),
                       ReusableRow(Name: "Critical", Value: snapshot.data!.critical.toString()),
                  ],
                 ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const CountriesList())));
              },
              child: Container(
                height: 50,
                width: 365,
                decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(5)),
                child: const Center(child: Text("Track Countries",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),)),
              ),
            )
          ],
        );
            }
          }
          )
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



//Model
class AllcountriesModel {
  int? updated;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  double? deathsPerOneMillion;
  int? tests;
  double? testsPerOneMillion;
  int? population;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  int? criticalPerOneMillion;
  int? affectedCountries;

  AllcountriesModel(
      {this.updated,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.tests,
      this.testsPerOneMillion,
      this.population,
      this.oneCasePerPeople,
      this.oneDeathPerPeople,
      this.oneTestPerPeople,
      this.activePerOneMillion,
      this.recoveredPerOneMillion,
      this.criticalPerOneMillion,
      this.affectedCountries});

  AllcountriesModel.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    todayRecovered = json['todayRecovered'];
    active = json['active'];
    critical = json['critical'];
    casesPerOneMillion = json['casesPerOneMillion'];
    deathsPerOneMillion = json['deathsPerOneMillion'];
    tests = json['tests'];
    testsPerOneMillion = json['testsPerOneMillion'];
    population = json['population'];
    oneCasePerPeople = json['oneCasePerPeople'];
    oneDeathPerPeople = json['oneDeathPerPeople'];
    oneTestPerPeople = json['oneTestPerPeople'];
    activePerOneMillion = json['activePerOneMillion'];
    recoveredPerOneMillion = json['recoveredPerOneMillion'];
    criticalPerOneMillion = json['criticalPerOneMillion'];
    affectedCountries = json['affectedCountries'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updated'] = this.updated;
    data['cases'] = this.cases;
    data['todayCases'] = this.todayCases;
    data['deaths'] = this.deaths;
    data['todayDeaths'] = this.todayDeaths;
    data['recovered'] = this.recovered;
    data['todayRecovered'] = this.todayRecovered;
    data['active'] = this.active;
    data['critical'] = this.critical;
    data['casesPerOneMillion'] = this.casesPerOneMillion;
    data['deathsPerOneMillion'] = this.deathsPerOneMillion;
    data['tests'] = this.tests;
    data['testsPerOneMillion'] = this.testsPerOneMillion;
    data['population'] = this.population;
    data['oneCasePerPeople'] = this.oneCasePerPeople;
    data['oneDeathPerPeople'] = this.oneDeathPerPeople;
    data['oneTestPerPeople'] = this.oneTestPerPeople;
    data['activePerOneMillion'] = this.activePerOneMillion;
    data['recoveredPerOneMillion'] = this.recoveredPerOneMillion;
    data['criticalPerOneMillion'] = this.criticalPerOneMillion;
    data['affectedCountries'] = this.affectedCountries;
    return data;
  }
}



//Api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/CovidModel.dart';
import 'package:http/http.dart' as http;
import 'Url.dart';

class GetcovidApi{

  Future <AllcountriesModel> GetApi()async{
     
     final response = await http.get(Uri.parse(covidurl.allcountries));
     var data = jsonDecode(response.body);
     if(response.statusCode == 200){
        return AllcountriesModel.fromJson(data);
     }else{
        throw Exception("error");
     }
  }
}



//UrlPAge
import 'package:flutter/material.dart';

class covidurl{
  static String baseurl = "https://disease.sh/v3/covid-19/";
  static String allcountries = baseurl + "all";
  static String countries = baseurl + "countries";
}

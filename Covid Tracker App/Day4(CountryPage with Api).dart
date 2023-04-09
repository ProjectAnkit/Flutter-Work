//CountryPage

import 'package:flutter/material.dart';
import 'package:flutter_application_1/CountryList%20Page/Countrytile.dart';
import 'package:flutter_application_1/Models/CovidModel.dart';
import 'package:flutter_application_1/Api/getdata.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> with TickerProviderStateMixin{
 
   late final AnimationController _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 3));

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
                           decoration: InputDecoration(border: InputBorder.none,hintText: "Search Country",hintStyle: TextStyle(color: Color.fromARGB(163, 255, 255, 255))),
                           style: TextStyle(color: Colors.white),
                        ),
                      )),
                  ),
                  Expanded(
                    child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return Countrytile(
                        Active: snapshot.data![index]['active'].toString(),
                         Name: snapshot.data![index]['country'].toString(),
                        flag: NetworkImage(snapshot.data![index]['countryInfo']['flag'].toString()),
                      );
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


//CountryTile

class Countrytile extends StatelessWidget {
  const Countrytile({super.key, required this.flag, required this.Name, required this.Active});
   
  final NetworkImage flag;
  final String Name;
  final String Active;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: SizedBox(
          height: 35,
          width: 45,
          child: Image(image: flag)),
        title: Text(Name,style: TextStyle(color: Colors.white),),
        subtitle: Text("Active cases : "+Active,style: TextStyle(color: Colors.white),),
      )
    );
  }
}


//CountryModel

class CountriesModel {
  int? updated;
  String? country;
  CountryInfo? countryInfo;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  int? deathsPerOneMillion;
  int? tests;
  int? testsPerOneMillion;
  int? population;
  String? continent;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;

  CountriesModel(
      {this.updated,
      this.country,
      this.countryInfo,
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
      this.continent,
      this.oneCasePerPeople,
      this.oneDeathPerPeople,
      this.oneTestPerPeople,
      this.activePerOneMillion,
      this.recoveredPerOneMillion,
      this.criticalPerOneMillion});

  CountriesModel.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    country = json['country'];
    countryInfo = json['countryInfo'] != null
        ? new CountryInfo.fromJson(json['countryInfo'])
        : null;
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
    continent = json['continent'];
    oneCasePerPeople = json['oneCasePerPeople'];
    oneDeathPerPeople = json['oneDeathPerPeople'];
    oneTestPerPeople = json['oneTestPerPeople'];
    activePerOneMillion = json['activePerOneMillion'];
    recoveredPerOneMillion = json['recoveredPerOneMillion'];
    criticalPerOneMillion = json['criticalPerOneMillion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updated'] = this.updated;
    data['country'] = this.country;
    if (this.countryInfo != null) {
      data['countryInfo'] = this.countryInfo!.toJson();
    }
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
    data['continent'] = this.continent;
    data['oneCasePerPeople'] = this.oneCasePerPeople;
    data['oneDeathPerPeople'] = this.oneDeathPerPeople;
    data['oneTestPerPeople'] = this.oneTestPerPeople;
    data['activePerOneMillion'] = this.activePerOneMillion;
    data['recoveredPerOneMillion'] = this.recoveredPerOneMillion;
    data['criticalPerOneMillion'] = this.criticalPerOneMillion;
    return data;
  }
}

class CountryInfo {
  int? iId;
  String? iso2;
  String? iso3;
  int? lat;
  int? long;
  String? flag;

  CountryInfo({this.iId, this.iso2, this.iso3, this.lat, this.long, this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    lat = json['lat'];
    long = json['long'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['iso2'] = this.iso2;
    data['iso3'] = this.iso3;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['flag'] = this.flag;
    return data;
  }
}


//CountryApi

class GetCountriesApi{

  Future <List<dynamic>>CountriesApi()async{
      
      final response = await http.get(Uri.parse(covidurl.countries));
      var data = jsonDecode(response.body);

      if(response.statusCode == 200){
       
       return data;

      }else{
         throw Exception("error");
      }
  }
}

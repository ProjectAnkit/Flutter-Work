import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Myhome(),
  ));
}

class Myhome extends StatelessWidget {
  const Myhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(  
        children: [
          _tile("Nirmala Momos ", "20 , yatharth",Icons.restaurant),
          Divider(),
           _tile("China Town", "nawada , chowk",Icons.restaurant),
           Divider(),
            _tile("Omaxe Cinema", "Sector 18",Icons.movie),
            Divider(),
             _tile("PVR Cinema", "Old delhi, railway station",Icons.movie),
             Divider(),
              _tile("Zauk Restaurant", "knowledge Park",Icons.restaurant),
              Divider(),
               _tile("Chinese Tadka", "jagat Farm",Icons.restaurant),
               Divider(),
                _tile("Kalyan cinema", "4 , Ansal Plaza",Icons.movie),
                Divider(),
                 _tile("10 ka Dum", "65 , Gamma",Icons.restaurant),
                 Divider(),
        ],
      ),
    );
  }
}

ListTile _tile(String title, String subtitle, IconData icon){
  return ListTile(
    title: Text(title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
    subtitle: Text(subtitle,style: TextStyle(fontSize: 12,fontStyle: FontStyle.normal,color: Colors.black45),),
    leading: Icon(icon,color: Colors.blue,)
  );
}

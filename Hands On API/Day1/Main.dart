import 'package:flutter/material.dart';

import 'HomePage.dart';

void main()
{
  runApp(Material(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  ));
}

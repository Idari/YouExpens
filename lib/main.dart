import 'package:flutter/material.dart';
import 'MyHomePage.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget
{
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      title: "MyExpenses",
      theme: ThemeData
      (
        primarySwatch: Colors.green,
        accentColor: Colors.purple,
        fontFamily: "OpenSans",
        
      ),
      home: MyHomePage(),
    );
  }
}

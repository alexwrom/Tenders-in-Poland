import 'package:flutter/material.dart';
import 'package:tenders/myconsts.dart';
import 'package:tenders/widgets/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: projectTitle,
      theme: ThemeData(
          // primaryColor: Colors.black26,
          ),
      initialRoute: '/',
      home:  HomePage(),

    );
  }
}

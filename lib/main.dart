import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_week_17/home_page.dart';

import 'package:google_week_17/work_page.dart';

const googleApiKey = "AIzaSyC1nlMkqsn-YpfQPK4RL6mDw-RBvrotquQ";
void main() {
  runApp(const MyApp());
}

late String lat;
late String long;
List? mylat = [];
List? mylong = [];
Set<Marker> markers = {};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        '/work': (context) => const WorkMapPage(),
      },
      initialRoute: '/',
    );
  }
}

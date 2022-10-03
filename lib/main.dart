
import 'package:utea_orbita_parker/providers/parker_provider.dart';
import 'package:utea_orbita_parker/splashscreen/home.dart';

import 'package:flutter/material.dart';

import 'package:utea_orbita_parker/screens/screens.dart';
import 'package:provider/provider.dart';
void main() => runApp( AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_){
          return ParkerProvider();
        })
      ],
      child: MyApp(),
    );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parker Solar probe',
      initialRoute: 'home',
      routes: {
        'home':(context) => DataBackupHome(), //HomeScreen(),
        'details':(context) => const tTweenAnimationBuilder(productos: [],)
      },
      theme:ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(color: Colors.indigo)
      ) ,
      
    );
  }
}
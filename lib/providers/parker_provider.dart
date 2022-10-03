
import 'package:utea_orbita_parker/models/parker.dart';
import 'package:utea_orbita_parker/models/now_playing_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class ParkerProvider extends ChangeNotifier{
  final String _apiKey = '78b7c72f4647f5558070bf775076f5e4/plasma3Day/hoja1';
  final String _baseUrl = 'api.sheety.co';
  final String _languaje = 'en-ES';


  List<Producto> OndisplayProductos = [];



  ParkerProvider(){
    print('Estamos en Orbita UTEA');

    this.getOnDisplayMovies();
  }  
  getOnDisplayMovies()async{
    
    var url = Uri.https(this._baseUrl, '78b7c72f4647f5558070bf775076f5e4/plasma3Day/hoja1',
    {
      'api_key' :_apiKey,
    });

    final response = await http.get(url);


    //final Map<String,dynamic> decodeData = json.decode(response.body);

    final   nowplayingResponse = NowPlayingResponse.fromJson(response.body);
    //print(nowplayingResponse.producto[0].precio);
    //print(nowplayingResponse.results[0].title);


    OndisplayProductos = nowplayingResponse.hoja1;
    print(OndisplayProductos);
    print(nowplayingResponse.hoja1);

    notifyListeners();
  }
}
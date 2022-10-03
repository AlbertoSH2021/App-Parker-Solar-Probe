// To parse this JSON data, do
//
//     final nowPlayingResponsive = nowPlayingResponsiveFromMap(jsonString);

import 'dart:convert';

import 'package:utea_orbita_parker/models/parker.dart';

class NowPlayingResponse {
    NowPlayingResponse({
        required this.hoja1,
    });

    List<Producto> hoja1;

    factory NowPlayingResponse.fromJson(String str) => NowPlayingResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NowPlayingResponse.fromMap(Map<String, dynamic> json) => NowPlayingResponse(
        hoja1: List<Producto>.from(json["hoja1"].map((x) => Producto.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "hoja1": List<dynamic>.from(hoja1.map((x) => x.toMap())),
    };
}



import 'dart:convert';


class Producto {
    Producto({
        required this.timeTag,
       required this.density,
       required this.speed,
       required this.temperature,
       required this.imagen,
        this.description,
        this.id,
    });

    DateTime timeTag;
    String density;
    String speed;
    String temperature;
    String imagen;
    String? description;
    int? id;

    factory Producto.fromJson(String str) => Producto.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Producto.fromMap(Map<String, dynamic> json) => Producto(
        timeTag: DateTime.parse(json["timeTag"]),
        density: json["density"],
        speed: json["speed"],
        temperature: json["temperature"],
        imagen: json["imagen"] == null ? null : json["imagen"],
        description: json["description"] == null ? null : json["description"],
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "timeTag": timeTag.toIso8601String(),
        "density": density,
        "speed": speed,
        "temperature": temperature,
        "imagen": imagen == null ? null : imagen,
        "description": description == null ? null : description,
        "id": id,
    };
}



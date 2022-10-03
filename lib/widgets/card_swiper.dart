
import 'package:utea_orbita_parker/models/parker.dart';
import 'package:utea_orbita_parker/screens/details_screen.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key, required this.movies});
  final  List<Producto> movies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var height = size.height * .5;
    var width = size.width * .6;
    return Container(
      width: double.infinity,
      height: height,
      color: const Color.fromARGB(255, 251, 248, 247),
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: width,
        itemHeight: size.height * .47,
        itemBuilder: (context, index) {
          bool _image = true;
          return GestureDetector(
            onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => tTweenAnimationBuilder(productos: [],))),//Navigator.pushNamed(context, 'Desafio',arguments: 'Movie_instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:  FadeInImage(
                placeholder: const NetworkImage('https://i.pinimg.com/736x/94/8f/c6/948fc60c858f561aee1e341723c7c29c.jpg'), 
                image: _image ? NetworkImage(movies[index].imagen):  NetworkImage('https://i.pinimg.com/736x/94/8f/c6/948fc60c858f561aee1e341723c7c29c.jpg'),
                fit: BoxFit.cover,
                ),
            ),
          );
        },
        ),
    );
  }
}
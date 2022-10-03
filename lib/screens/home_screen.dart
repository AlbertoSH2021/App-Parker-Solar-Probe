import 'dart:io';

import 'package:utea_orbita_parker/providers/parker_provider.dart';
import 'package:utea_orbita_parker/screens/details_screen.dart';
import 'package:utea_orbita_parker/widgets/card_swiper.dart';
import 'package:utea_orbita_parker/widgets/parker_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final moviesprovider = Provider.of<ParkerProvider>(context, listen: true);

    print(moviesprovider.OndisplayProductos);
    return Scaffold(
      appBar: AppBar(title: const Text('Atmosfera Solar: Tiempo Real',
              //  style: Theme.of(context).textTheme.bodySmall,
                maxLines: 2,
               // overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                ),
      elevation: 0,
      actions: [
        // ignore: prefer_const_constructors
        IconButton(onPressed: (){}, icon: Icon(Icons.search))
      ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //tTweenAnimationBuilder(productos: moviesprovider.OndisplayProductos,),
          //  

            
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
              width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://elsol-compress.s3-accelerate.amazonaws.com/files/1545048023467parker-orbit_0.gif')
                    )
                ),
              ),
            ),

            ParkerSlider(movies: moviesprovider.OndisplayProductos,),
            

          ],
        ),
      ),
    );
  }
}
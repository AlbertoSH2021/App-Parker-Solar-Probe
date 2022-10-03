
import 'package:utea_orbita_parker/models/parker.dart';
import 'package:utea_orbita_parker/models/now_playing_response.dart';
import 'package:flutter/material.dart';

class ParkerSlider extends StatelessWidget {
  const ParkerSlider({super.key, required this.movies});
  final  List<Producto> movies; 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 550,
      color: const Color.fromARGB(0, 255, 255, 255),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Atmosfera solar: '),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                //crossAxisSpacing:30,
                //childAspectRatio:10
              ),
              
              //scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                bool _image = true;
                return  Expanded(
                  child: Container(
                      margin: const EdgeInsets.all(2),
                     width: double.infinity,
                      height:300,
                      //color:Colors.primaries[index%Colors.primaries.length],
                      child: Column(
                        
                        children:  [
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, 'details',arguments: 'Movie_instance'),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child:  FadeInImage(
                                placeholder: NetworkImage('https://img1.wsimg.com/isteam/ip/840aaee8-c3c7-408a-8479-8a2ea2ac1693/F4F3AB1F-D85E-4B21-A2C0-736F0DF949A8-0001.jpeg'), 
                                image:  _image ? NetworkImage(movies[index].imagen):  NetworkImage('https://i.pinimg.com/736x/94/8f/c6/948fc60c858f561aee1e341723c7c29c.jpg'),
                                fit: BoxFit.cover,
                                height: 150,
                                ),
                            ),
                          ),

                          const SizedBox(height: 5),

                          Expanded(
                            child: FittedBox(
                              child: Column(
                         
                        crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text('Temperatura :${movies[index].temperature} ºC',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,),
                                  Text('Densidad :${movies[index].density}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  textAlign: TextAlign.center,),
                                  Text('Fecha:${movies[index].timeTag.year} - ${movies[index].timeTag.month + 1} - ${movies[index].timeTag.day}\n Hours:${movies[index].timeTag.hour}:0${movies[index].timeTag.minute} pm',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  textAlign: TextAlign.center,),
                                  Text('Speed:${movies[index].speed}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  textAlign: TextAlign.center,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                );
              } ),
          )
        ],
      ),
    );
  }
}

class _moviePoster extends StatelessWidget {
  const _moviePoster({
    Key? key, required this.movies, required this.index,
  }) : super(key: key);
  final int index;
  final  List<Producto> movies; 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 100,
      height: 170,
      color: const Color.fromARGB(0, 255, 255, 255),
      child: Column(
        children:  [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',arguments: 'Movie_instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: NetworkImage('https://i.pinimg.com/736x/94/8f/c6/948fc60c858f561aee1e341723c7c29c.jpg'), 
                image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.cover,
                height: 190,
                ),
            ),
          ),

          const SizedBox(height: 8),

           FittedBox(
            child: Text('${movies[index].density}',
             overflow: TextOverflow.ellipsis,
             maxLines: 2,
             textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}
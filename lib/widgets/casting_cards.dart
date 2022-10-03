import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(     
            height: 150,
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
           
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const FadeInImage(
                    width: 100,
                    height: 140,
                  placeholder: NetworkImage('https://i.pinimg.com/736x/94/8f/c6/948fc60c858f561aee1e341723c7c29c.jpg'), 
                  image: const NetworkImage('https://via.placeholder.com/300x400'),
                  fit: BoxFit.cover,
                    ),
                ),

                Text('actor.name djkaskha a dh aksd akhdska dka',
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
import 'package:utea_orbita_parker/splashscreen/cloud_page.dart';
import 'package:utea_orbita_parker/splashscreen/pagina_1.dart';
import 'package:utea_orbita_parker/splashscreen/pagina_completa.dart';
import 'package:flutter/material.dart';


const mainDataBackupColor = Color(0xff5113aa);
const secundaryDataBackupColor = Color(0xffbc53fa);
const backgroundColor = Color(0xfffce7fe);


class DataBackupHome extends StatefulWidget {
  @override
  State<DataBackupHome> createState() => _DataBackupHomeState();
}

class _DataBackupHomeState extends State<DataBackupHome> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<double> _progressAnimation;
  late Animation<double> _cloudOutAnimation;

  late Animation<double> _endingAnimation;
  late Animation<double> _bubblesAnimation;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      vsync: this,
      duration:const Duration( seconds:7,), 
      );
    _progressAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0, 
        0.65),
      );
     _cloudOutAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.7,
        0.85,
        curve: Curves.easeOut,
       ),
      );

      _bubblesAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        1.0,
        curve: Curves.decelerate,
       ),
      );

      _endingAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.8,
        1.0,
        curve: Curves.decelerate,
       ),
      );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 253, 253),
      body:Container(
        height: double.infinity,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://static.vecteezy.com/system/resources/previews/002/687/669/non_2x/space-adventure-cartoon-astronaut-standing-in-moon-vector.jpg'),// NetworkImage('https://i.gifer.com/19Ye.gif'),
            fit: BoxFit.cover
            )
        ),
        child: Stack(
          children: [
            DataBackoupInitalPage(
              progressAnimation: _progressAnimation,
              onAnimationStarted: () { 
                _animationController.forward();
               },
              ),
            DataBackupCloudPage(
              progressAnimation: _progressAnimation,
              cloudOutAnimation: _cloudOutAnimation,
              bubblesAnimation: _bubblesAnimation,
            ),

            DataBAckupCompletePage(
              endingAnimation: _endingAnimation,
            ),
          ],
        ),
      ),
    );
  }
}
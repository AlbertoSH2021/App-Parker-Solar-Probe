import 'package:utea_orbita_parker/splashscreen/home.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;



class _Bubble {
  _Bubble(
      {required this.color,
      required this.direction,
      required this.speed,
      required this.size,
      required this.initialPosition});
  final Color color;
  final double direction;
  final double speed;
  final double size;
  final double initialPosition;
}

class DataBackupCloudPage extends StatelessWidget {

   DataBackupCloudPage(
      {Key? key,
      required this.progressAnimation,
      required this.cloudOutAnimation,
      required this.bubblesAnimation})
      : super(key: key);

  final Animation<double> progressAnimation;
  final Animation<double> cloudOutAnimation;
  final Animation<double> bubblesAnimation;
  final bubbles = List<_Bubble>.generate(500, (index){

    final size = math.Random().nextInt(20) +5.0;
    final speed = math.Random().nextInt(50) +1.0;
    final directionRandom = math.Random().nextBool() ;
    final colorRandom= math.Random().nextBool();
    final direction = math.Random().nextInt(250) * (directionRandom ? 1.0 : -1.0);
    final color = colorRandom ? mainDataBackupColor : secundaryDataBackupColor;
    return _Bubble(
      color: color,
      direction: direction,
      speed: speed,
      size:size,
      initialPosition: index * 10.0,
    );
  });

  

  @override
  Widget build(BuildContext context) {
    final queryData = MediaQuery.of(context).size;

    return AnimatedBuilder(
        animation: Listenable.merge([
          progressAnimation,
          cloudOutAnimation,
        ]),
        builder: (context, snapshot) {
          final size = queryData.width * 0.4;
          final circlesize = size *
              math.pow(
                  (progressAnimation.value + cloudOutAnimation.value + 1), 2);
          final topPosition = queryData.height * 0.45;
          final centerMargin = queryData.width - circlesize;
          final leftSize = size * 0.65 * (1 - progressAnimation.value);
          final rightSize = size * 0.7 * (1 - progressAnimation.value);
          final leftMargin = queryData.width / 2 - leftSize * 1.2;
          final rightMargin = queryData.width / 2 - rightSize * 1.2;
          final middleMargin =
              queryData.width / 2 - (size / 2) * (1 - progressAnimation.value);
          final topOutPosition = queryData.height * cloudOutAnimation.value;

          return Positioned(
            left: 0,
            right: 0,
            top: topPosition - circlesize + topOutPosition,
            height: circlesize,
            child: Stack(
              children: [
                Positioned(
                  height: leftSize / 2,
                  width: size * (1 - progressAnimation.value), //size+30,
                  left: middleMargin,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(0, 255, 255, 255),
                    ),
                  ),
                ),
                Positioned(
                  height: leftSize,
                  width: leftSize,
                  left: leftMargin, //centerMargin/3,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(9, 255, 255, 255),
                    ),
                  ),
                ),
                Positioned(
                  height: rightSize,
                  width: rightSize,
                  right: rightMargin, //rightMargin/1.9,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(0, 255, 255, 255),
                    ),
                  ),
                ),
                Positioned(
                  height: circlesize,
                  width: circlesize,
                  bottom: 0,
                  left: centerMargin / 2,
                  child: ClipOval(
                    child: CustomPaint(
                      foregroundPainter: _CloudBubbePainter(
                        bubblesAnimation,bubbles,
                      ) ,
                      child: Container(
                        decoration:  BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://static.wixstatic.com/media/2592cb_0d59679e0d0748d79a79e55a2c07a610~mv2.gif'),
                          //fit: BoxFit.cover
                          ),
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 108, 106, 106),
                        ),
                        //child: Image(image: AssetImage('img/1.png')),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

//animacion burbujas 
class _CloudBubbePainter extends CustomPainter {

  _CloudBubbePainter(this.animation, this.bubbles): super(repaint: animation);

  final Animation<double> animation;
  final List<_Bubble> bubbles;
 
  @override
  void paint(Canvas canvas, Size size) {
   for(_Bubble _bubble in bubbles){
    final offset = Offset(
      size.width / 2 + _bubble.direction * animation.value,
      size.height * 1.2 *(1 - animation.value) -
      _bubble.speed * animation.value +
      _bubble.initialPosition * (1 - animation.value),
    );
     canvas.drawCircle(offset, _bubble.size, Paint()..color = _bubble.color);
   }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>false;
}
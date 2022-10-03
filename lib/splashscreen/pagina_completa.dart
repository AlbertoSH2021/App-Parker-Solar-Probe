
import 'dart:ui';
import 'package:utea_orbita_parker/screens/screens.dart';
import 'package:utea_orbita_parker/splashscreen/home.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutter/material.dart';


class DataBAckupCompletePage extends AnimatedWidget {

 DataBAckupCompletePage({required Animation<double>  endingAnimation}): super (listenable: endingAnimation);
 
 // final Animation<double>  endingAnimation;
  Animation get animation => (listenable as Animation);

  @override
  Widget build(BuildContext context) {
    return animation.value > 0 ? 
    Positioned.fill(

      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomPaint(
                  foregroundPainter: _DataBackupCompletePainter( animation),
                  child: Container(
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              ),
              
                   const Text('NASA Space apps Challenge \n Cusco 2022',
              textAlign:TextAlign.center,style: TextStyle(fontSize: 23,color:Colors.white ),
               ),
              Spacer(),
            const SizedBox(height: 60),
            Expanded(
              child:TweenAnimationBuilder(
                tween: Tween(begin:1.0, end:1.0),
                duration: const Duration(milliseconds: 400),
                builder: (_,double value, child){
                  return Opacity(
                    opacity: value,//value
                    child:Transform.translate(
                      offset:  Offset(
                        0.0,
                        50.0 * (1-value),//*value
                         ),
                      child:child,
                      ),
                    );
                },
              child: Column(
                children: [
                 
              Spacer(),
              OutlinedButton(
                
                 child: const Padding(
                 padding: EdgeInsets.symmetric(vertical:20.0 , horizontal: 40.0 , ),
                 child: Text(
                 'Iniciar aventura',
                 style:TextStyle(
                 color:mainDataBackupColor,
                 ) ,
                ),
               ),
               onPressed: (){
                 //Navigator.of(context).pop();//sirve para regresar atras
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen() ));
               }, 
              ),
              const SizedBox(height: 40,),
              ],
             ),),
            ),
           
          ],
        )),
    ): const SizedBox.shrink();
  }
}

class _DataBackupCompletePainter extends CustomPainter {

  _DataBackupCompletePainter(this.animation): super (repaint: animation);

  final Animation<dynamic> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
     ..color = Colors.yellow //mainDataBackupColor
     ..style = PaintingStyle.stroke
     ..strokeWidth = 1.0;

     final circlePath = Path();
    circlePath.addArc(Rect.fromCenter(
    center: Offset(size.width/2, size.height/2), 
    width: size.width, 
    height: size.height),
    vector.radians(-90.0),
    vector.radians(360.0 * animation.value)
     );

     final leftLine = size.width * 0.2;
     final rightLine = size.width * 0.4;

     final leftPercent = animation.value > 0.5 ? 1.0 : animation.value /0.5;
     final rightPercent = animation.value <0.5 ? 0.0 : (animation.value -0.5)/0.5;

     canvas.save();

    canvas.translate(size.width / 3, size.height /2);
    canvas.rotate(vector.radians(-45));

     canvas.drawLine(Offset.zero,Offset(0.0 , leftLine * leftPercent ), paint);
     canvas.drawLine(Offset(0.0 , leftLine),Offset(rightLine * rightPercent, leftLine), paint);

     canvas.restore();

    canvas.drawPath(circlePath, paint);
  }
  
  @override
  bool shouldRepaint(_DataBackupCompletePainter oldDelegate) => false;

 
}

import 'package:utea_orbita_parker/splashscreen/contador.dart';
import 'package:utea_orbita_parker/splashscreen/home.dart';
import 'package:flutter/material.dart';




const _duration = Duration(milliseconds: 500);

enum DataBackupState{
  initial,
  start,
  end,
}

class DataBackoupInitalPage extends StatefulWidget {

  DataBackoupInitalPage({Key? key,required this.onAnimationStarted,required this.progressAnimation}) : super(key: key);
    final VoidCallback onAnimationStarted;
    final Animation<double> progressAnimation;
  @override
  State<DataBackoupInitalPage> createState() => _DataBackoupInitalPageState();
}

class _DataBackoupInitalPageState extends State<DataBackoupInitalPage> {

  DataBackupState _curretState = DataBackupState.initial;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
       
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             const Expanded(
              flex: 3,
              child: Text('Ari Munani App',
                style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                ),
              ),
             ),
             ///
             ///
             SizedBox(height: 120),
            if( _curretState != DataBackupState.end)
            Expanded(
              flex:2,
              child: TweenAnimationBuilder(
                tween: Tween(
                begin:0.0, end: 1.0),
                duration: _duration,
                builder: (_, double value, child){
                  return Opacity(
                    opacity:value,//value
                    child:child,
                    );
                 },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                     const Text('Iniciando mision',
                     textAlign:TextAlign.center,
                    style: TextStyle(
                      fontSize:23,
                      color:Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                    ),
                     const SizedBox(height: 10,),
                    Expanded(
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: ProgressCounter(widget.progressAnimation)
                        )
                        )
                      ),
                  ],
                ),
              ),
            ),
            if( _curretState != DataBackupState.end)
            Expanded(
              flex:2,
              child: TweenAnimationBuilder(
                tween: Tween(begin:1.0, end:_curretState != DataBackupState.initial ? 0.0 :  1.0),
                duration: _duration,
                onEnd: (){
                  setState(() {
                   // _curretState = DataBackupState.start;
                    //_curretState = DataBackupState.end;
                  });
                },
                builder: (_,double value, child){
                  return Opacity(
                    opacity: value,//value
                    child:Transform.translate(
                      offset:  Offset(
                        0.0,
                        50.0 * value,//*value
                         ),
                      child:child,
                      ),
                    );
                },

              child: Column(
                  children: const [
                    Text('Inspira Conocimiento'),
                    const SizedBox(height: 10,),
                    Image(
                      image: NetworkImage('https://www.businessempresarial.com.pe/wp-content/uploads/2021/09/nasita.jpg'),
                      height: 100,
                      )
                  ],
                ),
               
              ),
            ),Spacer(),
            ///
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.0),
              child: AnimatedSwitcher(
                duration: _duration,
                child:_curretState == DataBackupState.initial ? 
                SizedBox(
                  width:double.infinity,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color:mainDataBackupColor ,
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(10) ),
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Bienvenido',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ) ,
                    onPressed: (){
                      setState(() {
                        _curretState = DataBackupState.start;
                      });
                      widget.onAnimationStarted();
                    },
                  ),
                ): OutlinedButton(
                  child:  const Padding(
                    padding: EdgeInsets.symmetric(vertical:20.0 , horizontal: 40.0 , ),
                    child: Text(
                      'Todos a bordo',
                      style:TextStyle(
                        color:Colors.black87,//mainDataBackupColor
                        ) ,
                      ),
                  ),
                  onPressed: (){
                   // Navigator.of(context).push.call(Ejemplo());
                  }, 
                  ),
              ),
            ),

              const SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
}


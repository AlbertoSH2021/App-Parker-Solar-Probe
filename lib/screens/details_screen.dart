import 'package:utea_orbita_parker/models/parker.dart';
import 'package:utea_orbita_parker/providers/parker_provider.dart';
import 'package:utea_orbita_parker/screens/screens.dart';
import 'package:flutter/material.dart';

class tTweenAnimationBuilder extends StatefulWidget {
  const tTweenAnimationBuilder({Key? key, 
  required this.productos}) : super(key: key);
   final List<Producto> productos; 

  @override
  State<tTweenAnimationBuilder> createState() => _tTweenAnimationBuilderState();
}

class _tTweenAnimationBuilderState extends State<tTweenAnimationBuilder> {
  bool _modelsList = true;
  int _count = 0;
  void _cambio (){
    setState(() {
      _modelsList = !_modelsList;
    });
  }
  

  late FixedExtentScrollController controller;
 
  @override
  void initState() {
    super.initState();
    controller = FixedExtentScrollController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(width: 60,),
          IconButton(onPressed: _cambio, icon: Icon(Icons.read_more)),  
          Expanded(child: Container()),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return HomeScreen(); 
            }));
          }
          , icon: Icon(Icons.near_me))    
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: (){
            final nextIndex = controller.selectedItem +1;
            controller.animateToItem(
              nextIndex, 
              duration: Duration(seconds: 1), 
              curve: Curves.easeInOut);
          }, 
      ),

      body: _modelsList ?  ListWheelScrollView.useDelegate(
        physics: ScrollPhysics(),
        controller: controller,
        onSelectedItemChanged: (value) {
        },
        squeeze: .8,
        diameterRatio: .6,
        itemExtent: 280,
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: 10,
          builder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 70,vertical: 10),
            color: Colors.primaries[index%Colors.primaries.length],
            height: 100,
          ) ;
        }, 
      )) : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            color: Colors.primaries[index%Colors.primaries.length],
            height: 100,
          ) ;
      },
      ),
    );
  }
}


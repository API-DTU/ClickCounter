import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

int D=0;
void main() => runApp(MaterialApp(
  title: 'Click Counter',
  theme: ThemeData(
    primaryColor: Colors.black,
    accentColor: Colors.lightGreenAccent,
  ),
  home: HomeScreen(),
));

class HomeScreen extends StatefulWidget {
  @override
  HomeScreen({Key key}) : super(key :key);
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>  with SingleTickerProviderStateMixin{

  int P;
  final database = Firestore.instance;
  
  AnimationController rotationController;
  void fetchdata()async{
    var local = await database.document('score/nx5P7Qc9R9tlRfgrYRNu').get();
    setState(() {
      P = local.data["Click"];
    });
  }
  void initState() {
    rotationController = AnimationController(vsync: this, duration: Duration(seconds: 5), upperBound: 2);
    fetchdata();


    super.initState();
  }




  List colors = [Colors.red, Colors.green, Colors.yellow,Colors.blue,Colors.orange,Colors.brown,Colors.black,Colors.pinkAccent,Colors.purpleAccent,Colors.amberAccent];
  List coll = ['android/assets/4-2-cartoon-transparent.png',
                     'android/assets/7-2-cartoon-picture.png',
                     'android/assets/1 (1).png',
                     'android/assets/1 (2).png',
                      'android/assets/1 (3).png',
                      'android/assets/1 (4).png',
                       'android/assets/1 (5).png',
                      'android/assets/1 (6).png',
                       'android/assets/1 (7).png',
                       'android/assets/1-2-cartoon-png-image.png'];

  Widget animation_widget()
  {
    switch(D%2)
    {
      case 1: return  RotationTransition(
          turns: Tween(begin: 0.0, end: -1.0).animate(rotationController),
          child: Container(
              child : Image(image : AssetImage(coll[D%10]))
          ),
        );
      case 0:return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
        child : Container(
            child : Image(image : AssetImage(coll[D%10]),)
        ),
      );
    }
  }


  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text("Click Counter",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
          )),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  child : animation_widget(),
                  ),
                Flexible(
                  child : Container(
                    padding: EdgeInsets.only(top : 30.0),
                child:Text(D.toString(),
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: colors[D%10],
                    ),
                       ),
                  ),
                ),
              Flexible(
                child : Container(
                  padding: EdgeInsets.only(top : 20.0,bottom: 30.0),
                  child:Text("Click Count",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: colors[(D+1)%10],
                    ),
                  ),
                ),
              ),

              Flexible(
                child : Container(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        ++D;
                        database.document('score/nx5P7Qc9R9tlRfgrYRNu').updateData({"Click": D});
                        animation_widget();
                      });
                    },
                    child: Text("CLICK"),
                    color: colors[(D+2)%10],
                    textColor: Colors.white,
                    ),
              ),
              ),

              Flexible(
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      rotationController.forward(from: 0.0);
                    });
                  },
                  child: Text("ROTATE"),
                  color: colors[(D+3)%10],
                  textColor: Colors.white,
                ),
              ),
              Flexible(
                child : Container(
                  padding: EdgeInsets.only(top: 30.0),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        D = 0;
                        database.document('score/nx5P7Qc9R9tlRfgrYRNu').updateData({"Click": D});
                        animation_widget();
                      });
                    },
                    child: Text("RESET"),
                    color: colors[(D+4)%10],
                    textColor: Colors.white,
                  ),
              ),
              ),

              Flexible(
                child : Container(
                  padding: EdgeInsets.only(top: 50.0 ),
                  child:Text("Last time you clicked : " + P.toString() +" times" ,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: colors[(D+5)%10],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}





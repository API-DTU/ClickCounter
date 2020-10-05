import 'package:flutter/material.dart';
import 'dart:math';

int D=0;
String Sameer = "0";
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

class HomeScreenState extends State<HomeScreen> {

  List colors = [Colors.red, Colors.green, Colors.yellow,Colors.blue,Colors.orange,Colors.brown];
  Random random = new Random();

  int index = 0;

  void changeIndex() {
    setState(() => index = random.nextInt(6));
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
          padding : EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Flexible(
                child:Center(
                       child : Text(Sameer,
                    style: TextStyle(
                      fontSize: 150.0,
                      fontWeight: FontWeight.bold,
                      color: colors[index],
                    ),
                       ),
                ),

                ),


              Flexible(
                child : Center(
                  child: FlatButton(
                    onPressed: () {
                      changeIndex();
                      setState(() {
                        ++D;
                        Sameer = D.toString();
                      });
                    },
                    child: Text("CLICK"),
                    color: colors[index],
                    textColor: Colors.white,
                    ),
              ),
              ),

              Flexible(
                  child: FlatButton(
                    onPressed: () {
                      changeIndex();
                      setState(() {
                        D = 0;
                        Sameer = D.toString();
                      });
                    },
                    child: Text("RESET"),
                    color: colors[index],
                    textColor: Colors.white,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cnt = 0;
  int turn=0;
  void turn_image(){
    setState(() {
      turn++;
      turn%=4;

    });
  }
  void increament() {
    setState(() {
      cnt++;
    });
  }
  void reset() {
    setState(() {
      cnt=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Click Counter',
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ),
      body: Container(
          child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          RotatedBox(
            quarterTurns: turn,
            child: Image(
                image: NetworkImage(
                    'https://www.trafalgar.com/real-word/wp-content/uploads/sites/3/2019/10/giant-panda-750x400.jpg'),
                height:200.0,
                width: 200.0
            ),
          ),
          Text(
            '$cnt',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                color: Colors.orange,
                fontStyle: FontStyle.italic),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Click Count',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: RaisedButton(
                onPressed: increament,
                hoverElevation:0.5 ,
                color:Colors.primaries[Random().nextInt(Colors.primaries.length)],
                // hoverColor: Colors.red,
                child: Text('CLICK',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    )
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: RaisedButton(
                onPressed: reset,
                color:Colors.pinkAccent,
                hoverElevation:1.0 ,
                hoverColor: Colors.red,
                child: Text('RESET',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    )
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: RaisedButton(
                onPressed: turn_image,
                color: Colors.purple,
                highlightColor:Colors.greenAccent,
                hoverElevation:1.0 ,
                hoverColor: Colors.red,
                child: Text('ROTATE',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                        color: Colors.white
                    )
                )
            ),
          )
        ]),
      )
      ),
    );
  }
}

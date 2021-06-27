import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.amberAccent,
    systemNavigationBarColor: Colors.amberAccent,
    systemNavigationBarDividerColor: Colors.blue.shade900,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(child: Text('Dice')),
          backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
    ),
  );
}
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}
class _DicePageState extends State<DicePage> {
  int leftdicenumber=5;
  int rightdicenumber=2;
  @override
  Widget build(BuildContext context) {
    void changediceface(){   // We use function to reduce the repeatation of code.
      leftdicenumber=Random().nextInt(6)+1;
      //rightdicenumber=Random().nextInt(6);
      // random function start from 0 but we don't have 0 then +1 add this will make change 0 into 1 and 5 into 6.
      rightdicenumber=Random().nextInt(6)+1;
    }
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            // child: Padding(
            // padding: const EdgeInsets.all(16.0),
            // ignore: deprecated_member_use
            child: FlatButton(
              onPressed: (){
               // leftdicenumber=6;
               // print('$leftdicenumber');
                //without the using of setState method through this method value change in console but dice remains same.
                //or
                setState(() {
                 changediceface();
                // leftdicenumber=Random().nextInt(6)+1;
               //  rightdicenumber=Random().nextInt(6)+1;
                  // we can also use this method to change the value of both dice at a time.
                });
              },
              child: Image.asset('images/dice$leftdicenumber.png'),
            ),
          ),
          Expanded(
            // child: Padding(
            //  padding: const EdgeInsets.all(16.0),
            // ignore: deprecated_member_use
            child: FlatButton(
              onPressed: (){
               setState(() {
                 changediceface();
                 //leftdicenumber=Random().nextInt(6)+1;
                 //rightdicenumber=Random().nextInt(6)+1;
               });
              },
              child: Image.asset('images/dice$rightdicenumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}


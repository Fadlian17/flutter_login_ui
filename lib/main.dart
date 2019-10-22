import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/delayed_animation.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    const padding = 15.0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xFF0F3443),
          body: Center(
            child: Column(
              children: <Widget>[
                AvatarGlow(
                  endRadius: 150,
                  duration: Duration(seconds: 2),
                  glowColor: Colors.white24,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 2),
                  startDelay: Duration(seconds: 1),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/cybertrain.png'),
                        backgroundColor: Colors.transparent,
                        radius: 3000.0,
                      )),
                ),
                DelayedAimation(
                  child: Text(
                    "Hi There, Im Sata",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 25.0,
                        color: color),
                  ),
                  delay: delayedAmount + 1000,
                ),
                SizedBox(
                  height: 10.0,
                ),
                DelayedAimation(
                  child: Text(
                    "Informasi Seputar Kereta Indonesia",
                    style: TextStyle(fontSize: 20.0, color: color),
                  ),
                  delay: delayedAmount + 3000,
                ),
                SizedBox(
                  height: 50.0,
                ),
                DelayedAimation(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: padding,width: 20.0,),
                      GoogleSignInButton(onPressed: (){},borderRadius: 10.0, ),
                      SizedBox(height: 20.0,width: 10.0,),
                      FacebookSignInButton(onPressed: (){},borderRadius: 10.0,),
                      SizedBox(height: 20.0,width: 20.0,),
                    ],
                    ),
                  ),
                DelayedAimation(
                  child: Text(
                    "Butuh Bantuan?",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white),
                  ),
                  delay: delayedAmount + 5000,
                ),
              ],
            ),
          )
        //  Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Text('Tap on the Below Button',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
        //     SizedBox(
        //       height: 20.0,
        //     ),
        //      Center(

        //   ),
        //   ],

        // ),
      ),
    );
  }

  
  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}

class Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 12.0,bottom: 12.0)
    );
  }
}


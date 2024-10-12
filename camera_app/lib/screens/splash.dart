import 'package:camera_app/screens/camerapage.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
   super.initState();
   Future.delayed(
    Duration(seconds: 2),
   (){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>CameraApp()));
   
  },
   );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: Image(image: AssetImage('assets/splash.webp')),
        ),
    );
   
  }
}
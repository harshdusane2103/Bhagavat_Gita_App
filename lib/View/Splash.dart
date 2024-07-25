import 'dart:async';


import 'package:bhagavat_gita/View/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;
    Timer(Duration(seconds: 3), () {
      Navigator
          .of(context)
          .pushReplacement(MaterialPageRoute(
          builder: (context) => Homescreen()));
    }
    );
    return Scaffold(
      // backgroundColor: Colors.black,

      body: Column(

        children: [

          SizedBox(height: 250,),
          Center(
            child: Container(
              height: h * 0.20,
              width: w * 0.50,
              decoration: BoxDecoration(

                  image: DecorationImage(

                    image: AssetImage('assets/image/logo2.png'),
                  )
              ),
            ),
          ),
          SizedBox(height: 20,),
          // Text('|| श्रीमद् भगवत् गीता  ||',style: TextStyle(color: Colors.red,fontSize: 36,fontWeight: FontWeight.bold),),
          Text('|| श्रीमद् भगवत् गीता  ||', style: TextStyle(
              color: Colors.amber, fontSize: 36, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}

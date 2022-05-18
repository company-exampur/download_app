import 'dart:async';
import 'package:exampur_mobile/SharePref/shared_pref.dart';


import 'package:exampur_mobile/selectchapterview.dart';

import 'package:exampur_mobile/utils/app_constants.dart';
import 'package:exampur_mobile/utils/images.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen() : super();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // callProvider();
 checkSharedPrefToken();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  Container(
       // padding: EdgeInsets.only(left: 60,right: 60,top: 30),
        height: double.infinity,
        width: double.infinity,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.asset(
              Images.splash_img,
          ),
        ),
      ),
      // body: Container(
      //   //alignment: Alignment.center,
      //   width: MediaQuery.of(context).size.width,
      //     height: MediaQuery.of(context).size.height,
      //     decoration: BoxDecoration(
      //       image: DecorationImage(
      //         image: AssetImage(Images.splash_img,),
      //         fit: BoxFit.scaleDown,
      //       ),
      //     ),
      //   child: Align(
      //     alignment: Alignment.bottomCenter,
      //     child: Padding(
      //       padding: const EdgeInsets.all(0),
      //       child: CircularProgressIndicator(),
      //     ),
      //   )
      // ),
    );
  }

 

  Future<void> checkSharedPrefToken() async {


      Timer(Duration(seconds: 3),
              ()=>Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) =>
              SelectChapterView()
              )
          )
      );
    }
  }




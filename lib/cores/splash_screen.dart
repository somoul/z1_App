import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      context.navigateNamedTo('onboardingScreen');
    });
    super.initState();
  } // SlashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
         
          children: [
            const Spacer(),
    
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Container(
                height:200,
                width: 200,
              
                  child:Image.asset('asset/image/image_png/z1_logo_px.png',width: 150,height: 150,)
              //      Image.svg(,
              //   height: 165,
              //   width: 165,
              // ) //Text('Show SlashScreen ')
                  ),
            ),
               const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: CircularProgressIndicator(
                value: null,
                strokeWidth: 5.0,
                color: Color.fromARGB(255, 101, 201, 226),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

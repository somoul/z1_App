import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SlashScreen extends StatefulWidget {
  const SlashScreen({Key? key}) : super(key: key);

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      context.navigateNamedTo('onboardingScreen');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // onRoute(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xff3999B7),
        child: Column(
          children: [
            const Spacer(),
            Center(
                child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Vector-based_example.svg/588px-Vector-based_example.svg.png',
              height: 165,
              width: 165,
            ) //Text('Show SlashScreen ')
                ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
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

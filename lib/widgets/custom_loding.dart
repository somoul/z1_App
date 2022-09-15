import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb? Container(
      color: Colors.black12,
      child: Center(
        child: listOfAnimations[1].widget,
      ),
    ):Container(
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 300),
        child: Center(
          child: listOfAnimations[0].widget,
        ),
      ),
    );
  }
}

class AppBody {
  final String title;
  final Widget widget;
  AppBody(
    this.title,
    this.widget,
  );
}

final listOfAnimations = <AppBody>[
  // AppBody(
  //   'Watery Desert',
  //   const Text(
  //     'Total animations: 20',
  //     textAlign: TextAlign.center,
  //     style: TextStyle(
  //       fontSize: 18,
  //     ),
  //   ),
  // ),
  
  
  // AppBody(
  //   'waveDots',
  //   LoadingAnimationWidget.waveDots(
  //     color: Colors.white,
  //     size: _kSize,
  //   ),
  // ),
  // AppBody(
  //   'inkDrop',
  //   LoadingAnimationWidget.inkDrop(
  //     color: Colors.white,
  //     size: _kSize,
  //   ),
  // ),
  // AppBody(
  //   'twistingDots',
  //   LoadingAnimationWidget.twistingDots(
  //     leftDotColor: const Color(0xFF1A1A3F),
  //     rightDotColor: const Color(0xFFEA3799),
  //     size: 55,
  //   ),
  // ),

  // AppBody(
  //   'threeRotatingDots',
  //   LoadingAnimationWidget.threeRotatingDots(
  //     color:Colors.white, ///const Color.fromARGB(255, 54, 143, 216),
  //     size: 55,
  //   ),
  // ),
  // AppBody(
  //   'staggeredDotsWave',
  //   LoadingAnimationWidget.staggeredDotsWave(
  //     color: Colors.white,
  //     size: _kSize,
  //   ),
  // ),
  AppBody(
    'fourRotatingDots',
    LoadingAnimationWidget.fourRotatingDots(
      color: Colors.white,
      size: 55,
    ),
  ),
  AppBody(
    'fallingDot',
    LoadingAnimationWidget.fallingDot(
      color: Colors.white,
      size: 55,
    ),
  ),
  // AppBody(
  //   'prograssiveDots',
  //   LoadingAnimationWidget.prograssiveDots(
  //     color: Colors.white,
  //     size: _kSize,
  //   ),
  // ),
  // AppBody(
  //   'discreteCircle',
  //   LoadingAnimationWidget.discreteCircle(
  //       color: Colors.white,
  //       size: 55,
  //       secondRingColor: Colors.black,
  //       thirdRingColor: Colors.purple),
  // ),
  // AppBody(
  //   'threeArchedCircle',
  //   LoadingAnimationWidget.threeArchedCircle(
  //     color: Colors.white,
  //     size: 55,
  //   ),
  // ),
  // AppBody(
  //   'bouncingBall',
  //   LoadingAnimationWidget.bouncingBall(
  //     color: Colors.white,
  //     size: _kSize,
  //   ),
  // ),
  // AppBody(
  //   'flickr',
  //   LoadingAnimationWidget.flickr(
  //     leftDotColor: const Color(0xFF0063DC),
  //     rightDotColor: const Color(0xFFFF0084),
  //     size: _kSize,
  //   ),
  // ),
  // AppBody(
  //   'hexagonDots',
  //   LoadingAnimationWidget.hexagonDots(
  //     color: Colors.white,
  //     size: 60,
  //   ),
  // ),
  // AppBody(
  //   'beat',
  //   LoadingAnimationWidget.beat(
  //     color: Colors.white,
  //     size: _kSize,
  //   ),
  // ),
  // AppBody(
  //   'twoRotatingArc',
  //   LoadingAnimationWidget.twoRotatingArc(
  //     color: Colors.white,
  //     size: _kSize,
  //   ),
  // ),
  // AppBody(
  //   'horizontalRotatingDots',
  //   LoadingAnimationWidget.horizontalRotatingDots(
  //     color: Colors.white,
  //     size: _kSize,
  //   ),
  // ),
  // AppBody(
  //   'newtonCradle',
  //   LoadingAnimationWidget.newtonCradle(
  //     color: Colors.white,
  //     size: 2 * _kSize,
  //   ),
  // ),
  // AppBody(
  //   'stretchedDots',
  //   LoadingAnimationWidget.stretchedDots(
  //     color: Colors.white,
  //     size: _kSize,
  //   ),
  // ),
  // AppBody(
  //   'halfTriangleDot',
  //   LoadingAnimationWidget.halfTriangleDot(
  //     color: Colors.white,
  //     size: _kSize,
  //   ),
  // ),
  // AppBody(
  //   'dotsTriangle',
  //   LoadingAnimationWidget.dotsTriangle(
  //     color: Colors.white,
  //     size: _kSize,
  //   ),
  // ),
];

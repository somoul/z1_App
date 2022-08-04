import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:z1_app/utils/app_color/app_colors.dart';

import '../../../widgets/custom_buttom.dart';
import '../../../widgets/onbording_screen/onbording_mobile_cart.dart';
import '../model/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingModel> onboardingList = <OnboardingModel>[
    OnboardingModel(
      title: 'Know your skill level',
      description:
          "The more you use app, the more you\nimprove and up your skill.",
      image: 'asset/image/image_svg/topic.svg',
    ),
    OnboardingModel(
      title: 'Know your skill level',
      description:
          "The place that help you to identify your\nskill level on your phone.",
      image: 'asset/image/image_svg/lavel.svg',
    ),
    OnboardingModel(
      title: 'Make it as habit',
      description:
          "The more you use app, the more you\nimprove and up your skill.",
      image: 'asset/image/image_svg/habit.svg',
    ),
  ];

  int currentIndex = 0;
  final controller = PageController(initialPage: 0, keepPage: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent, //Theme.of(context).primaryColor,

      body: kIsWeb
          ? SafeArea(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    currentIndex == 0
                        ? Container()
                        : Container(
                            height: 50,
                            width: 50,
                            // color: Colors.red,
                            padding: const EdgeInsets.only(left: 10, top: 15),
                            child: IconButton(
                              onPressed: () {
                                controller.animateToPage(currentIndex - 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              icon: const Icon(Icons.arrow_back_ios),
                              color: Colors.white,
                              iconSize: 24,
                            ),
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                        child: PageView(
                            controller: controller,
                            padEnds: false,
                            // pageSnapping: false,

                            onPageChanged: (index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            children: onboardingList.map((e) {
                              return CustomOnboardMobileCard(
                                onboardingModel: e,
                              );
                            }).toList())),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 50),
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: onboardingList.length,
                          effect: ExpandingDotsEffect(
                            dotHeight: 5,
                            dotWidth: 5,
                            dotColor: Theme.of(context).canvasColor,
                            activeDotColor: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          currentIndex != onboardingList.length - 1
                              ? TextButton(
                                  onPressed: () {
                                    //  LocalData.storeBool('onboarding', true);
                                    // context.router
                                    //     .replaceNamed('dassbordScreen');
                                       // context.navigateNamedTo('signInScreen'); 
                                        context.navigateNamedTo('loginQrCodeScreen'); 
                                  },
                                  child: const Text(
                                    'Skip',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 19),
                                  ),
                                )
                              : const SizedBox(),
                          currentIndex == onboardingList.length - 1
                              ? Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                 // color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    width: 1.05,
                                    color: Theme.of(context).canvasColor,
                                  ),
                                  color: Colors.transparent,
                                ),
                                child: Center(
                                  child: IconButton(
                                    padding:
                                        const EdgeInsets.only(bottom: 0),
                                    icon: const Icon(Icons.arrow_forward),
                                    color: Colors.white,
                                    onPressed: () {
                                      // LocalData.storeBool('onboarding', true);
                                      // context.router
                                      //     .replaceNamed('dassbordScreen');
                                         // context.navigateNamedTo('signInScreen'); 
                                          context.navigateNamedTo('loginQrCodeScreen'); 
                                    },
                                  ),
                                ),
                              )
                              : CustomButton(
                                  // height: 30,
                                  // padding: const EdgeInsets.only(
                                  //   left: 19,
                                  //   right: 19,
                                  //   top: 5,
                                  //   bottom: 5,
                                  // ),
                                  //colors: Colors.blueAccent,
                                  onTap: () {
                                    controller.animateToPage(currentIndex + 1,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.ease);
                                  },
                                  // isDisable: false,
                                  // isFill: true,
                                  title: 'Next',
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          : SafeArea(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    currentIndex != 0
                        ? Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.only(left: 15, top: 10),
                            child: IconButton(
                              onPressed: () {
                                controller.animateToPage(currentIndex - 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              icon: Icon(Platform.isIOS
                                  ? Icons.arrow_back_ios
                                  : Icons.arrow_back_ios,size: 28,),
                              color: AppColor.textColor,
                            ),
                          )
                        : Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.only(left: 10, top: 10),
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                        child: PageView(
                            controller: controller,
                            padEnds: false,
                            // pageSnapping: false,

                            onPageChanged: (index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            children: onboardingList.map((e) {
                              return CustomOnboardMobileCard(
                                onboardingModel: e,
                              );
                            }).toList())),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 50),
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: onboardingList.length,
                          effect: ExpandingDotsEffect(
                            dotHeight: 5,
                            dotWidth: 5,
                            dotColor: Theme.of(context).canvasColor,
                            activeDotColor: Theme.of(context).canvasColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            currentIndex != onboardingList.length - 1
                                ? TextButton(
                                    onPressed: () {
                                       context.navigateNamedTo('loginQrCodeScreen'); 
                                      //  LocalData.storeBool('onboarding', true);
                                      // context.router
                                      //     .replaceNamed('dassbordScreen');
                                    },
                                    child: const Text(
                                      'Skip',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.5),
                                    ),
                                  )
                                : const SizedBox(),
                            currentIndex == onboardingList.length - 1
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Ink(
                                      decoration: ShapeDecoration(
                                        color: Theme.of(context).canvasColor,
                                        shape: const CircleBorder(),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.arrow_forward),
                                        color: const Color.fromARGB(
                                            255, 144, 199, 218),
                                        onPressed: () {
                                          // LocalData.storeBool('onboarding', true);
                                          // context.router
                                          //     .replaceNamed('dassbordScreen');//loginQrCodeScreen
                                               //context.navigateNamedTo('signInScreen'); 
                                              context.navigateNamedTo('loginQrCodeScreen'); 
                                        },
                                      ),
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.only(right: 0),
                                    width: 100,
                                    // height: 60,
                                    child: CustomButton(
                                      // height: 100,
                                      onTap: () {
                                        controller.animateToPage(
                                            currentIndex + 1,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.ease);
                                      },
                                      // isDisable: false,
                                      // isFill: true,
                                      title: 'Next',
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

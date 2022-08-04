import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../cores/walk_though/model/onboarding_model.dart';

class CustomOnboardMobileCard extends StatelessWidget {
  final OnboardingModel? onboardingModel;
  const CustomOnboardMobileCard({this.onboardingModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DelayedDisplay(
          delay: const Duration(milliseconds: 500),
          slidingBeginOffset: const Offset(0, 0),
          child: SvgPicture.asset(
            onboardingModel!.image!,
          ),
        ),
        Column(
          children: [
            DelayedDisplay(
              delay: const Duration(milliseconds: 600),
              slidingBeginOffset: const Offset(0, 0),
              child: Text(
                onboardingModel!.title!,
                style: TextStyle(color:Colors.white.withOpacity(0.95),fontSize: 20,fontWeight:FontWeight.w600)
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DelayedDisplay(
              delay: const Duration(milliseconds: 700),
              slidingBeginOffset: const Offset(0, 0),
              child: Text(
                onboardingModel!.description!,
                style:  TextStyle(color: Colors.white.withOpacity(0.85),fontSize: 16,),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

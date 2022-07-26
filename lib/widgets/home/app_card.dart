import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../configs/app_constant.dart';

class AppCard extends StatelessWidget {
  final String? title;
  const AppCard({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(50)),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 8.0,
          sigmaY: 8.0,
        ),
        child: Stack(
          children: [
            Container(
              // height: 100,
              // width: 100,
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xffffffff).withOpacity(0.2),
                    // Colors.red
                    const Color(0xffffffff).withOpacity(0),
                  ],
                  // stops: const [
                  //   -0.1,
                  //   0,
                  // ],
                ),
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    style: const TextStyle(
                        // fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: 'Monoton',
                        fontSize: 15),
                    maxLines: 2,
                  ),

                  // Theme.of(context).textTheme.bodyMedium!.copyWith(
                  //     // fontWeight: FontWeight.w700,
                  //     color: Colors.white,
                  //     fontFamily: 'Poppins',
                  //     fontSize: 18),

                  const SizedBox(
                    height: defaultPadding / 4,
                  ),
                  Text(
                    'Avocado contain high vitamins that good for our health, and skins.',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontFamily: 'poppins',
                        letterSpacing: 0.1),
                    maxLines: 3,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        '05/05/2002',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            letterSpacing: 0.1),
                      ),
                      const SizedBox(width: defaultPadding),
                      Expanded(
                        child: SizedBox(
                          // color: Colors.yellowAccent,
                          height: 15,
                          child: Stack(
                            children: listStack.asMap().entries.map((e) {
                              return Positioned(
                                right: 0 + e.key.toDouble() * 6,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(Random().nextInt(0xffffffff))
                                            .withAlpha(0xff),
                                        Color(Random().nextInt(0xffffffff))
                                            .withAlpha(0xff)
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultPadding),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final listStack = <int>[
  1,
  2,
  3,
];

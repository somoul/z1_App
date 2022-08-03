import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:z1_app/configs/app_constant.dart';

import 'home/app_card.dart';

class TestComponent extends StatefulWidget {
  const TestComponent({Key? key}) : super(key: key);

  @override
  State<TestComponent> createState() => _TestComponentState();
}

class _TestComponentState extends State<TestComponent> {
  int selectedindex = 1;
  @override
  Widget build(BuildContext context) {
    final cameraController = MobileScannerController();
     cameraController.dispose();
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          //background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                   'https://images.unsplash.com/photo-1602947605863-d464e14f06ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YWJzdHJhY3QlMjBsaWdodHxlbnwwfHwwfHw%3D&w=1000&q=80'
                    // 'https://wallpaperaccess.com/full/1567836.jpg'
                    // 'https://cdn.wallpapersafari.com/1/39/VXsxcb.png'
                    // 'https://wallpaperaccess.com/full/2454622.jpg'
                    //'https://images.wallpapersden.com/image/download/blue-background-geometric-abstract_a2hrZ2mUmZqaraWkpJRmbmdlrWZlbWU.jpg'
                    // 'https://static.vecteezy.com/system/resources/previews/001/882/531/original/dark-blue-technology-background-free-vector.jpg'
                    // 'https://i.pinimg.com/originals/f9/99/9e/f9999e908cbd186b43b050a667291402.jpg',
                    ),
              ),
            ),
          ),

          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: defaultPadding, right: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello Virak!',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                  ),
                  Text(
                    'Welcome to webview app',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.only(
                        top: defaultPadding / 2,
                        bottom: 100 + defaultPadding,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,childAspectRatio: 0.8,
                        crossAxisCount: 2,
                      ),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              backgroundColor: Colors.transparent,
                              child: Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,//.withOpacity(0.5),
                                  borderRadius:
                                      BorderRadius.circular(defaultRadius * 2),
                                ),
                              ),
                            ),
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: ((context) => MyHomePage(
                          //           index: index,
                          //         )),
                          //   ),
                          // );
                        },
                        child: const AppCard(
                          title: 'Avocado',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 1.0,
                  sigmaY: 1.0,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 80,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(defaultRadius * 2),
                      topRight: Radius.circular(defaultRadius * 2),
                    ),
                  ),
                  // alignment: Alignment.center,
                  child: SafeArea(
                    top: false,
                    minimum: const EdgeInsets.only(
                        bottom: 20, top: 15, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        listNav.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedindex = index;
                            });
                          },
                          child: NavigationItem(
                            icon: listNav[index],
                            selected: selectedindex == index,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final listNav = <IconData>[
  CupertinoIcons.home,
  CupertinoIcons.qrcode_viewfinder,
  CupertinoIcons.profile_circled,
];

class NavigationItem extends StatelessWidget {
  final bool selected;
  final IconData icon;
  const NavigationItem({
    Key? key,
    this.selected = false,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(selected ? 1 : 0.1),
        shape: BoxShape.circle,
        // border: const Border(top: BorderSide()),
        boxShadow: selected
            ? const [
                BoxShadow(
                  color: Colors.white54,
                  spreadRadius: 4,
                  blurRadius: 10,
                ),
              ]
            : [],
      ),
      child: Icon(
        icon,
        color: selected ? Colors.indigo[900] : Colors.white,
      ),
    );
  }
}

// ignore_for_file: no_leading_underscores_for_local_identifiers, invalid_use_of_protected_member, unrelated_type_equality_checks, unnecessary_string_interpolations, prefer_const_constructors

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z1_app/modules/profile/controller/profile_controller.dart';
import 'package:z1_app/utils/pincode/controller/pincode_controller.dart';

import '../../../utils/app_color/app_colors.dart';
import '../../../utils/stolocal_data/local_data.dart';
import '../../controler_bottom_bar.dart/controller_bar.dart';
import '../../home/controler/home_comtroller.dart';
import '../model/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profileController = Get.put(ProfileController());
  final _bottomBarController = Get.put(BottomBarController());
  final _homeController = Get.put(HomeController());
  final _pinCodeController = Get.put(PinCodeController());

  String token = '';
  String imageProfile = '';
  @override
  void initState() {
    // Timer(Duration(seconds: 0), () async {
    //   token = await LocalData.getCurrentUser();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 0), () async {
    //   token = await LocalData.getCurrentUser();
    // });
    return
        //  Obx(
        //   () =>
        StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('user')
                .doc(_pinCodeController.stoToken.value)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              try {
                _profileController.profileModel.value = ProfileModel.fromJson(
                    snapshot.data?.data() as Map<String, dynamic>);
                _profileController.imageProfile.value =
                    _profileController.profileModel.value.image_profile!;
              } catch (e) {
                debugPrint('===== Show Error profile :$e');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 100),
                    child: CircularProgressIndicator(
                      value: null,
                      strokeWidth: 5.0,
                      color: Color.fromARGB(255, 101, 201, 226),
                    ),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Error'));
                } else if (snapshot.hasData) {
                  return Scaffold(
                      appBar: AppBar(
                        backgroundColor: AppColor.buttonColor.withOpacity(0.8),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 13, top: 4.5, bottom: 8.5),
                            child: GestureDetector(
                              //viewProfile
                              onTap: () {
                                context.navigateNamedTo('viewProfile');
                              },
                              child: Container(
                                height: 20,
                                width: 41,
                                decoration: BoxDecoration(
                                    // /  color: Colors.red,
                                    borderRadius: BorderRadius.circular(60),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          _profileController.profileModel.value
                                                      .image_profile !=
                                                  ''
                                              ? '${_profileController.profileModel.value.image_profile}'
                                              : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2wqLv2VOrfZeEAO3jSHxvmEL7eZA-VeJ_L8-L3q7gdcLzV6YeRGHpWoCr06dsriPxvYY&usqp=CAU',
                                        ),
                                        fit: BoxFit.cover),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 0.4,
                                          blurRadius: 0.4),
                                      BoxShadow(
                                          color: Colors.black,
                                          spreadRadius: 0.7,
                                          blurRadius: 0.7),
                                    ]),
                              ),
                            ),
                          ),
                        ],
                        leading: Container(),
                        //  IconButton(
                        //     onPressed: () {
                        //      // _bottomBarController.isSelecBaCK.value=true;
                        //     //  _bottomBarController.selecClickButtomNavigetionBarback.value=_bottomBarController.selecClickButtomNavigetionBar.value;
                        //       context.navigateBack();
                        //     },
                        //     icon: const Icon(
                        //       Icons.close,
                        //       size: 28,
                        //     )),
                        title: Text(
                          'Profile',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                      body: Container(
                          height: double.infinity,
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 40),
                            child: Column(
                              // mainAxisAlignment: Main,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Last name ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color:
                                                      AppColor.descriptionColor,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        const Spacer(),
                                        Text(
                                          '${_profileController.profileModel.value.last_name}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color:
                                                      AppColor.descriptionColor,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      // height: 20,
                                      thickness: 1.5,
                                      // indent: 20,
                                      endIndent: 0,
                                      color: Colors.blue.withOpacity(0.8),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'First name ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color:
                                                      AppColor.descriptionColor,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        const Spacer(),
                                        Text(
                                          _profileController.profileModel.value
                                                  .first_name ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color:
                                                      AppColor.descriptionColor,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      // height: 20,
                                      thickness: 1.5,
                                      // indent: 20,
                                      endIndent: 0,
                                      color: Colors.blue.withOpacity(0.8),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Email ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color:
                                                      AppColor.descriptionColor,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        const Spacer(),
                                        Text(
                                          _profileController
                                                  .profileModel.value.email ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color:
                                                      AppColor.descriptionColor,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      // height: 20,
                                      thickness: 1.5,
                                      // indent: 20,
                                      endIndent: 0,
                                      color: Colors.blue.withOpacity(0.8),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Pincode ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color:
                                                      AppColor.descriptionColor,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        const Spacer(),
                                        Text(
                                          _profileController
                                                  .profileModel.value.pincode ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color:
                                                      AppColor.descriptionColor,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      // height: 20,
                                      thickness: 1.5,
                                      // indent: 20,
                                      endIndent: 0,
                                      color: Colors.blue.withOpacity(0.8),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () async {
                                    // context.navigateNamedTo('loginQrCodeScreen');
                                    _pinCodeController.isSelectToken.value =
                                        false;
                                    LocalData.removeCurrentUser();
                                    context.navigateNamedTo('signInScreen');
                                    //  homeListModel.clear();
                                    _homeController.homeListModel.value;
                                    _bottomBarController
                                        .selecIndexButtomNavigetion.value = 1;
                                    // debugPrint(' ======  _homeController.homeListModel : ${ _homeController.homeListModel.length}');
                                  },
                                  child: Container(
                                    height: 55,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: AppColor.buttonColor,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15))),
                                    child: Center(
                                      child: Text(
                                        "Logout",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                color: AppColor.textColor,
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const SizedBox(
                                  height: 210,
                                ),
                              ],
                            ),
                          )));
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              }
              return Container();
            });
    //);
  }
}

// import 'package:auto_route/auto_route.dart';
// ignore_for_file: unnecessary_null_comparison, prefer_final_fields, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers, prefer_const_constructors, unrelated_type_equality_checks

import 'dart:convert';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z1_app/modules/home/controler/home_comtroller.dart';

import '../../../utils/app_color/app_colors.dart';
import '../../../widgets/custom_buttom.dart';
import '../../../widgets/custom_loding.dart';
import '../../../widgets/customtextfield.dart';
import '../../../widgets/customvalidate.dart';
import '../../profile/page/viewprofile_screen.dart';
import 'add_detail_app.dart';

class AddAppScreen extends StatefulWidget {
  const AddAppScreen({Key? key}) : super(key: key);

  @override
  State<AddAppScreen> createState() => _AddAppScreenState();
}

class _AddAppScreenState extends State<AddAppScreen> {
  final _homeController = Get.put(HomeController());

  File? imageFile;
  final nameAppEditingController = TextEditingController();
  final linkAppEditingController = TextEditingController();
  final colorAppEditingController = TextEditingController();
  final imageAppEditingController = TextEditingController();
  // final detaillAppEditingController = TextEditingController();
  final addImageAppEditingController = TextEditingController();
  // final isUserEditingController = TextEditingController();
  // bool isUser=false;
  var collection = FirebaseFirestore.instance.collection('app_list');
  Map<String, dynamic> myData = {};

  final maxLines = 11;

  List _testList = [
    {'no': 1, 'keyword': 'True'},
    {'no': 2, 'keyword': 'Flase'},
  ];
  List<DropdownMenuItem<Object?>> _dropdownTestItems = [];
  var _selectedTest;

  @override
  void initState() {
    _dropdownTestItems = buildDropdownTestItems(_testList);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<DropdownMenuItem<Object?>> buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in _testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  onChangeDropdownTests(selectedTest) {
    // print(selectedTest);
    setState(() {
      _selectedTest = selectedTest;
    });
  }

  FirebaseStorage storage = FirebaseStorage.instance;
  UploadTask? uploadTask;
  final List<String> genderItems = [
    'True',
    'Flase',
  ];
  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'AddApp',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        body: Obx(
          () => Form(
            key: _formKey,
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 20, right: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: _homeController
                                          .isNameAppEditingController.value
                                      ? const EdgeInsets.only(bottom: 28)
                                      : const EdgeInsets.only(bottom: 0),
                                  child: Text(
                                    'Name app :',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                            fontSize: 14.5,
                                            color: AppColor.descriptionColor,
                                            fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 15,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 255,
                                        height: 43,
                                        child: TextField(
                                          maxLines: 1,
                                          cursorHeight: 13,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontSize: 13.5,
                                                  color:
                                                      AppColor.descriptionColor,
                                                  fontWeight: FontWeight.w300),
                                          controller: nameAppEditingController,
                                          onChanged: (String value) {
                                            _homeController
                                                .isNameAppEditingController
                                                .value = value == '';
                                            // myData['app_name'] = value;
                                          },
                                          decoration: InputDecoration(
                                            hintText: "name app",
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: AppColor
                                                      .descriptionColor
                                                      .withOpacity(0.4),
                                                  width: 1.8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              // gapPadding: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: AppColor
                                                      .descriptionColor
                                                      .withOpacity(0.5),
                                                  width: 1.8),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 3, left: 10),

                                            // errorText:'test error'
                                          ),
                                        ),
                                      ),
                                      _homeController
                                              .isNameAppEditingController.value
                                          ? SizedBox(
                                              height: 23,
                                              width: 200,
                                              child: CustomValidate(
                                                isValidate: true,
                                                decription:
                                                    'Please! Input name app.',
                                              ),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              ]),

                          SizedBox(
                            height:
                                _homeController.isNameAppEditingController.value
                                    ? 12
                                    : 25,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: _homeController
                                        .isLinkAppEditingController.value
                                    ? const EdgeInsets.only(bottom: 28)
                                    : const EdgeInsets.only(bottom: 0),
                                child: Text(
                                  'Link App :',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontSize: 14.5,
                                          color: AppColor.descriptionColor,
                                          fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 22,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 255,
                                      height: 43,
                                      child: TextField(
                                        maxLines: 1,
                                        cursorHeight: 13,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                fontSize: 13.5,
                                                color:
                                                    AppColor.descriptionColor,
                                                fontWeight: FontWeight.w300),
                                        controller: linkAppEditingController,
                                        onChanged: (String value) {
                                          _homeController
                                              .isLinkAppEditingController
                                              .value = value == '';
                                          // myData['app_name'] = value;
                                        },
                                        decoration: InputDecoration(
                                            // labelText: 'Enter your Password',
                                            hintText: "link app",
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: AppColor
                                                      .descriptionColor
                                                      .withOpacity(0.4),
                                                  width: 1.8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              // gapPadding: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: AppColor
                                                      .descriptionColor
                                                      .withOpacity(0.5),
                                                  width: 1.8),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 3, left: 10)),
                                      ),
                                    ),
                                    _homeController
                                            .isLinkAppEditingController.value
                                        ? SizedBox(
                                            height: 23,
                                            width: 200,
                                            child: CustomValidate(
                                              isValidate: true,
                                              decription:
                                                  'Please! Input link app.',
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:
                                _homeController.isLinkAppEditingController.value
                                    ? 12
                                    : 25,
                          ),

                          Row(
                            children: [
                              Padding(
                                padding: _homeController
                                        .isColorAppEditingController.value
                                    ? const EdgeInsets.only(bottom: 28)
                                    : const EdgeInsets.only(bottom: 0),
                                child: Text(
                                  'Color App :',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontSize: 14.5,
                                          color: AppColor.descriptionColor,
                                          fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 255,
                                      height: 43,
                                      child: TextField(
                                        maxLines: 1,
                                        cursorHeight: 13,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                fontSize: 13.5,
                                                color:
                                                    AppColor.descriptionColor,
                                                fontWeight: FontWeight.w300),
                                        controller: colorAppEditingController,
                                        onChanged: (String value) {
                                          // myData['app_name'] = value;
                                          _homeController
                                              .isColorAppEditingController
                                              .value = value == '';
                                        },
                                        decoration: InputDecoration(
                                            hintText: "color app",
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: AppColor
                                                      .descriptionColor
                                                      .withOpacity(0.4),
                                                  width: 1.8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              // gapPadding: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: AppColor
                                                      .descriptionColor
                                                      .withOpacity(0.5),
                                                  width: 1.8),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 3, left: 10)),
                                      ),
                                    ),
                                    _homeController
                                            .isColorAppEditingController.value
                                        ? SizedBox(
                                            height: 23,
                                            width: 200,
                                            child: CustomValidate(
                                              isValidate: true,
                                              decription:
                                                  'Please! Input color app.',
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height:
                                _homeController.isLinkAppEditingController.value
                                    ? 12
                                    : 25,
                          ),
                          Row(children: [
                            Text(
                              'IsUser app :',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontSize: 14.5,
                                      color: AppColor.descriptionColor,
                                      fontWeight: FontWeight.w400),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 13),
                              child: Container(
                                width: 255,
                                height: 43,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColor.descriptionColor,
                                          blurRadius: 0.5,
                                          spreadRadius: 0.5)
                                    ]),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 12, left: 8),
                                  child: Text(
                                    'True ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
                                            fontSize: 14.5,
                                            color: AppColor.descriptionColor,
                                            fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //   height: 43,
                            //   width: 260,
                            //   margin: EdgeInsets.only(left: 13),
                            //   child: DropdownButtonFormField2(
                            //     decoration: InputDecoration(
                            //       isDense: true,
                            //       contentPadding: EdgeInsets.zero,
                            //       border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(10),
                            //         borderSide:
                            //             BorderSide(width: 10, color: Colors.red),
                            //       ),
                            //     ),
                            //     isExpanded: true,
                            //     hint: Text(
                            //       'Select option',
                            //       style: TextStyle(
                            //           fontSize: 13.5, color: Colors.black38),
                            //     ),
                            //     icon: Icon(
                            //       Icons.arrow_drop_down,
                            //       color: AppColor.descriptionColor,
                            //     ),
                            //     iconSize: 30,
                            //     buttonHeight: 60,
                            //     buttonPadding:
                            //         const EdgeInsets.only(left: 20, right: 10),
                            //     dropdownDecoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(10),
                            //         boxShadow: [
                            //           BoxShadow(
                            //               color: AppColor.descriptionColor,
                            //               blurRadius: 0.2,
                            //               spreadRadius: 0.2)
                            //         ]),
                            //     items: genderItems
                            //         .map((item) => DropdownMenuItem<String>(
                            //               value: item,
                            //               child: Text(
                            //                 item,
                            //                 style: TextStyle(
                            //                     fontSize: 13.5,
                            //                     color: AppColor.descriptionColor
                            //                         .withOpacity(0.65)),
                            //               ),
                            //             ))
                            //         .toList(),
                            //     validator: (value) {
                            //       if (value == null) {
                            //         return 'Please select gender.';
                            //       }
                            //     },
                            //     onChanged: ( value) {

                            //        _homeController.isSelecOption.value=value=='True' ;
                            //          debugPrint('=======selectedValue00:${ _homeController.isSelecOption.value}');
                            //       //Do something when changing the item if you want.
                            //     },
                            //     onSaved: (value) {
                            //       debugPrint('=======selectedValue:$value');
                            //       selectedValue = value.toString();
                            //     },
                            //   ),
                            // )
                          ]),

                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Detail app :',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              fontSize: 14.5,
                                              color: AppColor.descriptionColor,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AddDetaillAppScreen()),
                                        );
                                      },
                                      child: Container(
                                        width: 248,
                                        height: 43,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color:
                                                      AppColor.descriptionColor,
                                                  blurRadius: 0.5,
                                                  spreadRadius: 0.5)
                                            ]),
                                        child: Center(
                                          child: Text(
                                            'Write detail about app ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    fontSize: 14.5,
                                                    color: AppColor
                                                        .descriptionColor,
                                                    fontWeight:
                                                        FontWeight.w300),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              _homeController.isDetailApp.value == true
                                  ? Container(
                                      height: 23,
                                      width: 200,
                                      margin: EdgeInsets.only(left: 45, top: 4),
                                      child: CustomValidate(
                                        isValidate: true,
                                        decription: 'Please! Input detail app.',
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                          SizedBox(
                            height: _homeController.isDetailApp.value ? 12 : 25,
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  _homeController.isSelecPassLinkImage.value
                                      ? 'Link Image'
                                      : 'Add Image :',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          fontSize: 14.5,
                                          color: AppColor.descriptionColor,
                                          fontWeight: FontWeight.w400),
                                ),
                              ),
                              _homeController.isSelecPassLinkImage.value ==
                                      false
                                  ? const SizedBox(
                                      width: 20,
                                    )
                                  : const SizedBox(
                                      width: 5,
                                    ),
                              _homeController.isSelecPassLinkImage.value ==
                                      false
                                  ? GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 7),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    ListTile(
                                                      minLeadingWidth: 7,
                                                      horizontalTitleGap: 14,
                                                      leading: Icon(
                                                        Icons.remove_red_eye,
                                                        color: imageFile != null
                                                            ? AppColor
                                                                .descriptionColor
                                                            : AppColor
                                                                .descriptionColor
                                                                .withOpacity(
                                                                    0.6),
                                                        size: 22,
                                                      ),
                                                      title: Text(
                                                        'View Image',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5!
                                                            .copyWith(
                                                                fontSize: 14.5,
                                                                color: imageFile !=
                                                                        null
                                                                    ? AppColor
                                                                        .descriptionColor
                                                                    : AppColor
                                                                        .descriptionColor
                                                                        .withOpacity(
                                                                            0.6),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                      onTap: () async {
                                                        imageFile != null
                                                            ? Navigator.pop(
                                                                context)
                                                            : null;
                                                        imageFile != null
                                                            ? Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        ViewProfile(
                                                                            imageFile:
                                                                                imageFile!)),
                                                              )
                                                            : null;
                                                      },
                                                    ),
                                                    ListTile(
                                                      minLeadingWidth: 7,
                                                      horizontalTitleGap: 14,
                                                      leading: Icon(
                                                        Icons.photo,
                                                        color: AppColor
                                                            .descriptionColor,
                                                        size: 22,
                                                      ),
                                                      title: Text(
                                                        'Photo',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5!
                                                            .copyWith(
                                                                fontSize: 14.5,
                                                                color: AppColor
                                                                    .descriptionColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                      onTap: () async {
                                                        Navigator.pop(context);
                                                        _homeController
                                                            .isSelecPassLinkImage
                                                            .value = false;
                                                        _homeController
                                                            .getImage()
                                                            .then((value) {
                                                          imageFile = value;
                                                          _homeController
                                                              .imagePassLinkImage
                                                              .value = '';
                                                          _homeController
                                                              .getImageStorage(
                                                                  value);
                                                        });
                                                      },
                                                    ),
                                                    ListTile(
                                                      minLeadingWidth: 7,
                                                      horizontalTitleGap: 14,
                                                      leading: Icon(
                                                        Icons.link,
                                                        color: AppColor
                                                            .descriptionColor,
                                                        size: 22,
                                                      ),
                                                      title: Text(
                                                        'Link Image',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5!
                                                            .copyWith(
                                                                fontSize: 14.5,
                                                                color: AppColor
                                                                    .descriptionColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                      onTap: () {
                                                        imageFile == null
                                                            ? _homeController
                                                                    .imagePassLinkImage
                                                                    .value =
                                                                'https://www.kindpng.com/picc/m/543-5432090_transparent-addition-symbol-clipart-icon-button-add-png.png'
                                                            : Container();
                                                        Navigator.pop(context);
                                                        _homeController
                                                            .isSelecPassLinkImage
                                                            .value = true;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      height: 25,
                                                    )
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      child: GetBuilder<HomeController>(
                                        builder: (_) {
                                          return Container(
                                              height: 100,
                                              width: 100,
                                              margin: const EdgeInsets.only(
                                                  left: 0),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: AppColor
                                                          .descriptionColor,
                                                      blurRadius: 0.5,
                                                      spreadRadius: 0.5)
                                                ],
                                                image: imageFile != null
                                                    ? DecorationImage(
                                                        invertColors: false,
                                                        image: FileImage(
                                                            imageFile!),
                                                        fit: BoxFit.cover,
                                                      )
                                                    : const DecorationImage(
                                                        invertColors: false,
                                                        image: NetworkImage(
                                                            'https://www.kindpng.com/picc/m/543-5432090_transparent-addition-symbol-clipart-icon-button-add-png.png',
                                                            scale: 10),
                                                        fit: BoxFit.cover,
                                                        opacity: 10,
                                                        scale: 10,
                                                      ),
                                              ));
                                        },
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                        left: 19,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 250,
                                            height: 43,
                                            child: TextField(
                                              maxLines: 1,
                                              cursorHeight: 13,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                      fontSize: 13.5,
                                                      color: AppColor
                                                          .descriptionColor,
                                                      fontWeight:
                                                          FontWeight.w300),
                                              controller:
                                                  addImageAppEditingController,
                                              onChanged: (value) {
                                                _homeController
                                                    .imagePassLinkImage
                                                    .value = value;
                                                _homeController
                                                    .isImagePassLinkImage
                                                    .value = value == '';
                                              },
                                              // onSubmitted: (value) {
                                              //   setState(() {
                                              //     _homeController.imagePassLinkImage.value =
                                              //       value;
                                              //   });
                                              // },
                                              decoration: InputDecoration(
                                                hintText: 'link image',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: AppColor
                                                          .descriptionColor
                                                          .withOpacity(0.4),
                                                      width: 1.8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  // gapPadding: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: AppColor
                                                          .descriptionColor
                                                          .withOpacity(0.5),
                                                      width: 1.8),
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        top: 3, left: 10),
                                                // prefixIcon: Container(
                                                //     margin: const EdgeInsets.only(
                                                //       // top: 2,
                                                //       // bottom:2.2,
                                                //       right: 10,
                                                //       // left: 2
                                                //     ),
                                                //     decoration: BoxDecoration(
                                                //         color: Colors.white,
                                                //         borderRadius:
                                                //             BorderRadius.circular(10),
                                                //         boxShadow: [
                                                //           BoxShadow(
                                                //               color: AppColor
                                                //                   .descriptionColor,
                                                //               blurRadius: 0.2,
                                                //               spreadRadius: 0.2)
                                                //         ]),
                                                //     // child: _homeController
                                                //     //             .imagePassLinkImage
                                                //     //             .value ==
                                                //     //         ''
                                                //     //     ? imageFile != ''
                                                //     //         ? Image.file(
                                                //     //             imageFile!,
                                                //     //             width: 15,
                                                //     //             height: 10,
                                                //     //             fit: BoxFit.cover,
                                                //     //           )
                                                //     //         : Image.network(
                                                //     //             'https://www.kindpng.com/picc/m/543-5432090_transparent-addition-symbol-clipart-icon-button-add-png.png',
                                                //     //             width: 15,
                                                //     //             height: 10,
                                                //     //             fit: BoxFit.cover,
                                                //     //           )
                                                //     //     : Image.network(
                                                //     //         _homeController
                                                //     //             .imagePassLinkImage.value,
                                                //     //         width: 15,
                                                //     //         height: 10,
                                                //     //         fit: BoxFit.cover,
                                                //     //       )

                                                //           ),

                                                suffixIcon: IconButton(
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 7),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                ListTile(
                                                                  minLeadingWidth:
                                                                      7,
                                                                  horizontalTitleGap:
                                                                      14,
                                                                  leading: Icon(
                                                                    Icons
                                                                        .remove_red_eye,
                                                                    color: _homeController
                                                                            .imagePassLinkImage
                                                                            .value
                                                                            .isNotEmpty
                                                                        ? AppColor
                                                                            .descriptionColor
                                                                        : AppColor
                                                                            .descriptionColor
                                                                            .withOpacity(0.6),
                                                                    size: 22,
                                                                  ),
                                                                  title: Text(
                                                                    'View Image',
                                                                    style: Theme.of(context).textTheme.headline5!.copyWith(
                                                                        fontSize:
                                                                            14.5,
                                                                        color: _homeController.imagePassLinkImage.value.isNotEmpty
                                                                            ? AppColor
                                                                                .descriptionColor
                                                                            : AppColor.descriptionColor.withOpacity(
                                                                                0.6),
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                  onTap:
                                                                      () async {
                                                                    _homeController
                                                                            .imagePassLinkImage
                                                                            .value
                                                                            .isNotEmpty
                                                                        ? Navigator.pop(
                                                                            context)
                                                                        : null;
                                                                    _homeController
                                                                            .imagePassLinkImage
                                                                            .value
                                                                            .isNotEmpty
                                                                        ? Navigator
                                                                            .push(
                                                                            context,
                                                                            MaterialPageRoute(
                                                                                builder: (context) => ViewProfile(
                                                                                      imageView: _homeController.imagePassLinkImage.value,
                                                                                    )),
                                                                          )
                                                                        : null;
                                                                  },
                                                                ),
                                                                ListTile(
                                                                  minLeadingWidth:
                                                                      7,
                                                                  horizontalTitleGap:
                                                                      14,
                                                                  leading: Icon(
                                                                    Icons.photo,
                                                                    color: AppColor
                                                                        .descriptionColor,
                                                                    size: 22,
                                                                  ),
                                                                  title: Text(
                                                                    'Photo',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .headline5!
                                                                        .copyWith(
                                                                            fontSize:
                                                                                14.5,
                                                                            color:
                                                                                AppColor.descriptionColor,
                                                                            fontWeight: FontWeight.w400),
                                                                  ),
                                                                  onTap:
                                                                      () async {
                                                                    Navigator.pop(
                                                                        context);
                                                                    // _homeController
                                                                    //     .isSelecPackLinkImage
                                                                    //     .value = false;
                                                                    _homeController
                                                                        .getImage()
                                                                        .then(
                                                                            (value) async {
                                                                      imageFile =
                                                                          value;
                                                                      _homeController
                                                                          .imagePassLinkImage
                                                                          .value = '';

                                                                      debugPrint(
                                                                          '========WOrk 1==========');
                                                                      setState(
                                                                          () {
                                                                        imageFile =
                                                                            value;
                                                                        _homeController
                                                                            .getImageStorage(value);
                                                                        debugPrint(
                                                                            '========WOrk 2==========');
                                                                        _homeController
                                                                            .isSelecPassLinkImage
                                                                            .value = false;
                                                                        imageFile =
                                                                            value;
                                                                      });

                                                                      // final ref=FirebaseStorage.instance.ref().child(imageFile!.path);
                                                                      // // ref.putFile(ref);
                                                                      // ref.putString(data)

                                                                      //  Navigator.pop(context);
                                                                    });
                                                                  },
                                                                ),
                                                                ListTile(
                                                                  minLeadingWidth:
                                                                      7,
                                                                  horizontalTitleGap:
                                                                      14,
                                                                  leading: Icon(
                                                                    Icons.link,
                                                                    color: AppColor
                                                                        .descriptionColor,
                                                                    size: 22,
                                                                  ),
                                                                  title: Text(
                                                                    'Link Image',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .headline5!
                                                                        .copyWith(
                                                                            fontSize:
                                                                                14.5,
                                                                            color:
                                                                                AppColor.descriptionColor,
                                                                            fontWeight: FontWeight.w400),
                                                                  ),
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    _homeController
                                                                        .isSelecPassLinkImage
                                                                        .value = true;
                                                                  },
                                                                ),
                                                                const SizedBox(
                                                                  height: 25,
                                                                )
                                                              ],
                                                            ),
                                                          );
                                                        });
                                                  },
                                                  icon: Icon(
                                                    Icons.arrow_drop_down,
                                                    color: AppColor.buttonColor,
                                                    size: 23,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          _homeController.isImagePassLinkImage
                                                      .value ==
                                                  true
                                              ? SizedBox(
                                                  height: 23,
                                                  width: 200,
                                                  child: CustomValidate(
                                                    isValidate: true,
                                                    decription:
                                                        'Please! Input link image app.',
                                                  ),
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ),
                              // )
                            ],
                          ),

                          // const Spacer(),
                          const Spacer(),
                          const Spacer(),
                          CustomButton(
                            padding: const EdgeInsets.only(left: 0, right: 20),
                            onTap: () async {
                              // _homeController
                              //     .getImageStorage(imageFile!);
                              //     .then((value) {

                              // });
                              //  .then((value){

                              //  });
                              //  _homeController.isLoding.value = true;
                              if (nameAppEditingController.text.isEmpty) {
                                _homeController
                                    .isNameAppEditingController.value = true;
                              }
                              if (linkAppEditingController.text.isEmpty) {
                                _homeController
                                    .isLinkAppEditingController.value = true;
                              }
                              if (colorAppEditingController.text.isEmpty) {
                                _homeController
                                    .isColorAppEditingController.value = true;
                              }
                              if (_homeController.detailApp.value.isEmpty) {
                                _homeController.isDetailApp.value = true;
                              }
                              if (addImageAppEditingController.text.isEmpty ||
                                  _homeController.imageApp.value == '') {
                                _homeController.isImagePassLinkImage.value =
                                    true;
                              }
                              if (nameAppEditingController.text.isNotEmpty &&
                                  linkAppEditingController.text.isNotEmpty &&
                                  colorAppEditingController.text.isNotEmpty &&
                                  _homeController.detailApp.value.isNotEmpty &&
                                  addImageAppEditingController.text.isNotEmpty && _homeController.imageApp.value != '') {
                                _homeController.isLoding.value = true;
                                myData = {
                                  "app_colo": colorAppEditingController.text,
                                  'app_link': linkAppEditingController.text, 
                                  //'online-quiz-75798.firebaseapp.com',
                                  'app_name': nameAppEditingController
                                      .text, //'test Add22',
                                  'isUser': true,
                                  //_homeController.isSelecOption.value, //true,
                                  'link_image':
                                      _homeController.imageApp.value != ''
                                          ? _homeController.imageApp.value
                                          : addImageAppEditingController.text,
                                  // 'https://firebasestorage.googleapis.com/v0/b/z1-app-a10ff.appspot.com/o/app_icon%2Fic_launcher.png?alt=media&token=36e2a95d-c989-42a4-9792-f2dfad770987'
                                };
                                collection.add(myData) // <-- Your data
                                    .then((_) {
                                  _homeController.isLoding.value = false;
                                  Navigator.pop(context);

                                  debugPrint('Added');
                                }).catchError((error) {
                                  debugPrint('Add failed: $error');
                                });
                              }
                            },
                            title: 'Submit',
                          ),
                          const Spacer(),
                          // const Spacer(),
                        ]),
                  ),
                ),
                _homeController.isLoding.value
                    ? const CustomLoading()
                    : Container(),
              ],
            ),
          ),
        ));
  }
}

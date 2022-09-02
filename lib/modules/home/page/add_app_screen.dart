import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../../utils/app_color/app_colors.dart';
import '../../../widgets/custom_buttom.dart';

class AddAppScreen extends StatefulWidget {
  const AddAppScreen({Key? key}) : super(key: key);

  @override
  State<AddAppScreen> createState() => _AddAppScreenState();
}

class _AddAppScreenState extends State<AddAppScreen> {
  final nameAppEditingController = TextEditingController();
  final linkAppEditingController = TextEditingController();
  final colorAppEditingController = TextEditingController();
  final imageAppEditingController = TextEditingController();
  final detaillAppEditingController = TextEditingController();
  final isUserEditingController = TextEditingController();
  // bool isUser=false;
  var collection = FirebaseFirestore.instance.collection('app_list');
  var myData = {
    "app_colo": '141355',
    'app_link': 'online-quiz-75798.firebaseapp.com',
    // 'app_name': 'test Add22',
    'isUser': true,
    'link_image':
        'https://firebasestorage.googleapis.com/v0/b/z1-app-a10ff.appspot.com/o/app_icon%2Fic_launcher.png?alt=media&token=36e2a95d-c989-42a4-9792-f2dfad770987'
  };
  final maxLines = 11;
  List<dynamic> countries = [];
  String? countryId;
  @override
  void initState() {
    countries.add({'id': 1, 'label': 'true'});
    countries.add({'id': 2, 'label': 'false'});
    super.initState();
  }

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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20),
          child: Column(children: [
            Row(
              children: [
                Text(
                  'Name app :',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 14.5,
                      color: AppColor.descriptionColor,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Container(
                    height: 43,
                    width: 260,
                    child: TextField(
                      cursorHeight: 13,
                      controller: nameAppEditingController,
                      onChanged: (String value) {
                        myData['app_name'] = value;
                      },
                      //  onChanged:(String aa)
//                        {
//  myData['app_name']='1234';

//                        }

                      // onSubmitted: (String value) {},
                      // focusedBorder: OutlineInputBorder(
                      //             gapPadding: 0.0,
                      //             borderRadius: BorderRadius.circular(10),
                      //             borderSide: BorderSide(
                      //                 color: AppColor.descriptionColor
                      //                     .withOpacity(0.5),
                      //                 width: 1.8),
                      //           ),
                      decoration: InputDecoration(
                        // labelText: 'Enter your Password',
                        // hintText: "Enter your Password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColor.descriptionColor.withOpacity(0.4),
                              width: 1.8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 0.0,
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColor.descriptionColor.withOpacity(0.5),
                              width: 1.8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 23, horizontal: 23),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Link app :',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 14.5,
                      color: AppColor.descriptionColor,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                  ),
                  child: Container(
                    height: 43,
                    width: 260,
                    child: TextField(
                      cursorHeight: 15,
                      controller: linkAppEditingController,
                      onChanged: (String value) {
                        myData['app_link'] = value;
                      },
                      // focusedBorder: OutlineInputBorder(
                      //             gapPadding: 0.0,
                      //             borderRadius: BorderRadius.circular(10),
                      //             borderSide: BorderSide(
                      //                 color: AppColor.descriptionColor
                      //                     .withOpacity(0.5),
                      //                 width: 1.8),
                      //           ),
                      decoration: InputDecoration(
                        // labelText: 'Enter your Password',
                        // hintText: "Enter your Password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColor.descriptionColor.withOpacity(0.4),
                              width: 1.8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 0.0,
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColor.descriptionColor.withOpacity(0.5),
                              width: 1.8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 23, horizontal: 23),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Color app :',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 14.5,
                      color: AppColor.descriptionColor,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 19,
                  ),
                  child: Container(
                    height: 43,
                    width: 260,
                    child: TextField(
                      cursorHeight: 13,
                      controller: colorAppEditingController,
                      onChanged: (String value) {
                        myData['app_color'] = value;
                      },
                      // focusedBorder: OutlineInputBorder(
                      //             gapPadding: 0.0,
                      //             borderRadius: BorderRadius.circular(10),
                      //             borderSide: BorderSide(
                      //                 color: AppColor.descriptionColor
                      //                     .withOpacity(0.5),
                      //                 width: 1.8),
                      //           ),
                      decoration: InputDecoration(
                        // labelText: 'Enter your Password',
                        // hintText: "Enter your Password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColor.descriptionColor.withOpacity(0.4),
                              width: 1.8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 0.0,
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColor.descriptionColor.withOpacity(0.5),
                              width: 1.8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 23, horizontal: 23),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Row(
            //   children: [
            //     Text(
            //       'Image app :',
            //       style: Theme.of(context).textTheme.headline5!.copyWith(
            //           fontSize: 14.5,
            //           color: AppColor.descriptionColor,
            //           fontWeight: FontWeight.w400),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(
            //         left: 15,
            //       ),
            //       child: Container(
            //         height: 43,
            //         width: 260,
            //         child: TextField(
            //           cursorHeight: 13,
            //           controller: imageAppEditingController,
            //           onSubmitted: (String value) {},

            //           decoration: InputDecoration(
            //             // labelText: 'Enter your Password',
            //             // hintText: "Enter your Password",
            //             enabledBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(10),
            //               borderSide: BorderSide(
            //                   color: AppColor.descriptionColor.withOpacity(0.4),
            //                   width: 1.8),
            //             ),
            //             focusedBorder: OutlineInputBorder(
            //               gapPadding: 0.0,
            //               borderRadius: BorderRadius.circular(10),
            //               borderSide: BorderSide(
            //                   color: AppColor.descriptionColor.withOpacity(0.5),
            //                   width: 1.8),
            //             ),
            //             contentPadding: const EdgeInsets.symmetric(
            //                 vertical: 23, horizontal: 23),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            // const SizedBox(
            //   height: 20,
            // ),
            Row(children: [
              Text(
                'IsUser app :',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 14.5,
                    color: AppColor.descriptionColor,
                    fontWeight: FontWeight.w400),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Container(
                    height: 43,
                    width: 260,
                    child: FormHelper.dropDownWidget(
                        contentPadding: 7,
                        
                        textColor: AppColor.descriptionColor,
                        hintColor: AppColor.descriptionColor,
                        // suffixIcon: Icon(Icons.expand_more),
                        prefixIcon: null,
                        context,
                        'null ',
                        // underline:Container()
                        countryId,
                        countries,
                         (value) {
                      countryId = value;
                      debugPrint('=======selec countryId:$value ');
                    }, (validate) {
                      if (validate == null) {
                        return 'Please Select Country';
                      }
                      return null;
                    },
                        paddingLeft: 0,
                        paddingRight: 0,
                        borderColor: Colors.red,
                        borderFocusColor:
                            AppColor.descriptionColor.withOpacity(0.4),
                        borderRadius: 10,
                        optionLabel: 'label',
                        optionValue: 'id'),
                  )),
           
           
            ]),
            //   ],
            // ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail app :',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 14.5,
                      color: AppColor.descriptionColor,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Container(
                    height: maxLines * 23.0,
                    width: 260,
                    child: TextField(
                      maxLines: maxLines,
                      cursorHeight: 13,
                      controller: detaillAppEditingController,
                      style: TextStyle(),
                      onSubmitted: (String value) {},
                      decoration: InputDecoration(
                        // labelText: 'Enter your Password',
                        // hintText: "Enter your Password",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColor.descriptionColor.withOpacity(0.4),
                              width: 1.8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 0.0,
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColor.descriptionColor.withOpacity(0.5),
                              width: 1.8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 23, horizontal: 23),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // const Spacer(),
            //const Spacer(),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              //myData
              padding: const EdgeInsets.only(left: 0, right: 20),
              onTap: () {
                //              myData = {
                // "app_colo": colorAppEditingController.text,
                //   'app_link': 'online-quiz-75798.firebaseapp.com',
                //   'app_name': 'test Add22',
                //   'isUser': true,
                //   'link_image':
                //       'https://firebasestorage.googleapis.com/v0/b/z1-app-a10ff.appspot.com/o/app_icon%2Fic_launcher.png?alt=media&token=36e2a95d-c989-42a4-9792-f2dfad770987'

                // };

                collection
                    .add(myData) // <-- Your data
                    .then((_) => print('Added'))
                    .catchError((error) => print('Add failed: $error'));
              },
              title: 'Submit',
            ),
            const Spacer(),
            const Spacer(),
          ]),
        ),
      ),
    );
  }
}

class Person {
  final String? gender;
  final String? name;
  final String? url;

  Person({this.name, this.gender, this.url});
}

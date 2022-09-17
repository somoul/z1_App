// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:z1_app/modules/home/controler/home_comtroller.dart';

import '../../../utils/app_color/app_colors.dart';
import '../../../widgets/custom_buttom.dart';
import '../../../widgets/custom_chip.dart';
import '../../../widgets/customtextfield.dart';

class AddDetaillAppSuccessScreen extends StatefulWidget {
  const AddDetaillAppSuccessScreen({Key? key}) : super(key: key);

  @override
  State<AddDetaillAppSuccessScreen> createState() => _AddDetaillAppSuccessScreenState();
}

class _AddDetaillAppSuccessScreenState extends State<AddDetaillAppSuccessScreen> {
     final _homeController = Get.put(HomeController());
    // final maxLines = 11;
    int indexAdddetaillsuccess = 1;
  @override
  void initState() {
    // TODO: implement initState
   _homeController.listIndexAdddetaillsuccess.add(indexAdddetaillsuccess);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AdddetaillSuccess',
          style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body:  Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
          child: ListView.builder(

              //padding: EdgeInsets.only(top: 10),
              cacheExtent: 20,
              scrollDirection: Axis.vertical,
              itemCount:_homeController.listIndexAdddetaillsuccess.length, //_homeController.indexAdddetaillsuccess.value,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    // Text(' Test :${_homeController.successTextEditingController[index].text}'),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          const CustomTextField(
                              //controller:_homeController.successTextEditingController[index],
                              ),
                          GestureDetector(
                            onTap: () {
                              // _homeController.listIndexAdddetaillsuccess
                              _homeController.indexAdddetaillsuccess.value =
                                  _homeController.indexAdddetaillsuccess.value -
                                      1;
                            },
                            child: Container(
                              height: 19,
                              width: 19,
                              margin: EdgeInsets.only(left: 8),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Center(
                                  child: Icon(
                                Icons.horizontal_rule,
                                size: 15,
                                color: Colors.white,
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                        index ==_homeController.listIndexAdddetaillsuccess.length-1 //_homeController.indexAdddetaillsuccess.value - 1
                        ?const CustomShip(title:'View',)
                        // TextButton(
                        //     onPressed: () {
                              // _homeController.indexAdddetaillsuccess.value =
                              //     _homeController.indexAdddetaillsuccess.value +
                              //         1;
                        //       //_homeController.indexAdddetaillsuccess.add(1);
                        //       //  indexAdddetaillsuccess=indexAdddetaillsuccess+1;
                        //     },
                        //     child:const Text('one:'))
                        : Container(),
                       const Spacer(),
                        index ==_homeController.listIndexAdddetaillsuccess.length-1
                          // index == _homeController.indexAdddetaillsuccess.value - 1
                        ? Padding(
                          padding:const  EdgeInsets.only(right: 22),
                          child: CustomShip(title:'add file',
                          onTap:(){
                            debugPrint(' === Test Ontap========');
                            _homeController.listIndexAdddetaillsuccess.add(indexAdddetaillsuccess+1);
                            // _homeController.indexAdddetaillsuccess.value =
                            //       _homeController.indexAdddetaillsuccess.value +
                            //           1;
                          }
                          ),
                        )
                        : Container()

                    ],
                   )
                  
                  ],
                );
              }),
       // ),
      ),

      // ),
    );
  }
}
// class AddDetaillAppSuccessScreen extends StatelessWidget {
//   const AddDetaillAppScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
    // final _homeController = Get.put(HomeController());
    // // final maxLines = 11;
    // int indexAdddetaillsuccess = 1;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Adddetaill',
//           style: Theme.of(context).textTheme.headline5!.copyWith(
//               fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
//         ),
//       ),
//       body: Obx(
//         () => Padding(
//           padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
            
//               ListView.builder(
//                   shrinkWrap: true,
//                   // cacheExtent: 200,
//                   padding: EdgeInsets.only(top: 10),
//                   //itemExtent: 10.0,
//                   scrollDirection: Axis.vertical,
//                   itemCount: _homeController.indexAdddetaillsuccess
//                       .value, //_homeController.indexAdddetaillsuccess.length,
//                   itemBuilder: (context, index) {
//                     return Row(
//                       crossAxisAlignment: index == 0
//                           ? CrossAxisAlignment.start
//                           : CrossAxisAlignment.start,
//                       mainAxisAlignment: index == 0
//                           ? MainAxisAlignment.start
//                           : MainAxisAlignment.center,
//                       children: [
//                         index == 0
//                             ? const Text('product detail :')
//                             : Container(),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                              // Text(' Test :${_homeController.successTextEditingController[index].text}'),
//                             Padding(
//                               padding: index != 0
//                                   ? const EdgeInsets.only(left: 65, top: 10)
//                                   : const EdgeInsets.only(left: 10, top: 10),
//                               child: Row(
//                                 children: [
//                                    CustomTextField(
//                                   //controller:_homeController.successTextEditingController[index],
//                                   ),
//                                   GestureDetector(
//                                     onDoubleTap: () {
//                                       _homeController.indexAdddetaillsuccess
//                                           .value = _homeController
//                                               .indexAdddetaillsuccess.value -
//                                           1;
//                                     },
//                                     child: Container(
//                                       height: 18,
//                                       width: 18,
//                                       margin: EdgeInsets.only(left: 8),
//                                       decoration: BoxDecoration(
//                                           color: Colors.red,
//                                           borderRadius:
//                                               BorderRadius.circular(50)),
//                                       child: Center(
//                                           child: Icon(
//                                         Icons.horizontal_rule,
//                                         size: 15,
//                                       )),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             index ==
//                                     _homeController
//                                             .indexAdddetaillsuccess.value -
//                                         1
//                                 ? TextButton(
//                                     onPressed: () {
//                                       _homeController.indexAdddetaillsuccess
//                                           .value = _homeController
//                                               .indexAdddetaillsuccess.value +
//                                           1;
//                                       //_homeController.indexAdddetaillsuccess.add(1);
//                                       //  indexAdddetaillsuccess=indexAdddetaillsuccess+1;
//                                     },
//                                     child: Text('one:'))
//                                 : Container()
//                           ],
//                         ),
//                       ],
//                     );
//                   }),
//             ],
//           ),
//         ),
//       ),

//       // ),
//     );
//     // );
//   }
// }

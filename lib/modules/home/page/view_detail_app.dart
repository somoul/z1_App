import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';
import 'package:z1_app/modules/home/controler/home_comtroller.dart';

import '../../../widgets/custom_circle_line.dart';

class ViewDetailScreen extends StatelessWidget {
  const ViewDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _processIndex=0;
    int _processes=3;
    final _homeController = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          title: Text('ViewDetailScreen'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
              child:StatusChange.tileBuilder(
                theme: StatusChangeThemeData(
                  direction: Axis.vertical,
                  connectorTheme:
                      ConnectorThemeData(space: 1.0, thickness: 1.0),
                ),
                builder: StatusChangeTileBuilder.connected(
                  itemWidth: (_) =>
                      MediaQuery.of(context).size.width / _processes,//
                  contentWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'add content here',
                        style: TextStyle(
                          color: Colors
                              .blue, // change color with dynamic color --> can find it with example section
                        ),
                      ),
                    );
                  }, itemCount: 2,
                  // nameWidgetBuilder: (context, index) {
                  //   return Padding(
                  //     padding: const EdgeInsets.all(20),
                  //     child: Text(
                  //       'your text ',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: getColor(index),
                  //       ),
                  //     ),
                  //   );
                  // },
                  // indicatorWidgetBuilder: (_, index) {
                  //   if (index <= _processIndex) {
                  //     return DotIndicator(
                  //       size: 35.0,
                  //       border: Border.all(color: Colors.green, width: 1),
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(6.0),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             color: Colors.green,
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   } else {
                  //     return OutlinedDotIndicator(
                  //       size: 30,
                  //       borderWidth: 1.0,
                  //       color: todoColor,
                  //     );
                  //   }
                  // },
                  // lineWidgetBuilder: (index) {
                  //   if (index > 0) {
                  //     if (index == _processIndex) {
                  //       final prevColor = getColor(index - 1);
                  //       final color = getColor(index);
                  //       var gradientColors;
                  //       gradientColors = [
                  //         prevColor,
                  //         Color.lerp(prevColor, color, 0.5)
                  //       ];
                  //       return DecoratedLineConnector(
                  //         decoration: BoxDecoration(
                  //           gradient: LinearGradient(
                  //             colors: gradientColors,
                  //           ),
                  //         ),
                  //       );
                  //     } else {
                  //       return SolidLineConnector(
                  //         color: getColor(index),
                  //       );
                  //     }
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  // itemCount: _processes.length,
               
               
                ),
              ),
              
              ),
          //     Stepper(

          //       steps: [

          //   Step(
          //       title: Container(height: 10,
          //       width: 10 ,
          //       color: Colors.red,
          //         child: Text('11')),
          //       subtitle: Text('222x'),
          //       content: Column(
          //         children: [Text('11'), Text('11'), Text('11')],
          //       )),
          //   Step(
          //       title: Text('222'),
          //       content: Row(
          //         children: [],
          //       ))
          // ])

              // CircleLine(
              //     linePositionFromTop: 10,
              //     contentMarginBottom: 0,
              //     marginTop: 5,
              //     color: const Color(0xff4F4F4F),
              //     size: 7.5,
              //     path: {
              //       'color': Colors.black.withOpacity(0.4),
              //       // Color(0xffDADADA),
              //       'width': 1.0,
              //     },
              //     steps: _homeController.successTextEditingController
              //         .asMap()
              //         .entries
              //         .map((e) {
              //       return
              //       {
              //         'color': const Color(0xff4F4F4F),
              //         'background': const Color(0xff4F4F4F),
              //         'label': '1',
              //         'content':'11'
              //         //  RepaymentCard(
              //         //   repaymentHistory: e.value,
              //         //   noRepaymentHistory: e.key +
              //         //       _repaymentController
              //         //           .paymentHistoryPaid.length +
              //         //       1,
              //         // )
              //       };
              //     }).toList()),

              //      CircleLine(
              //       itemCount:_homeController.successTextEditingController
              //               .length-1 ,
              //         linePositionFromTop: 10,
              //         contentMarginBottom: 0,
              //         marginTop: 5,
              //         color:Color(0xff6690FF), //const Color(0xff4F4F4F),
              //         size: 6.5,
              //         path: {
              //           'color':Colors.red,// Colors.black.withOpacity(0.4),
              //           // Color(0xffDADADA),
              //           'width': 1.0,
              //         },
              //         // steps:
              //         //  _repaymentController.paymentHistoryNext
              //         //     .asMap()
              //         //     .entries
              //         //     .map((e) {
              //         //   return {
              //         //     'color': const Color(0xff4F4F4F),
              //         //     'background': const Color(0xff4F4F4F),
              //         //     'label': '1',
              //         //     'content': RepaymentCard(
              //         //       repaymentHistory: e.value,
              //         //       noRepaymentHistory: e.key +
              //         //           _repaymentController.paymentHistoryPaid.length +
              //         //           1,
              //         //     )
              //         //   };
              //         // }).toList()),
              // ),
              ),
       // )
        );
  }
}

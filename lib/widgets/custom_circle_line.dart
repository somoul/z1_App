// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:z1_app/modules/home/controler/home_comtroller.dart';

// class CircleLine extends StatefulWidget {
//   final Axis direction;
//   // final List steps;
//   final double size;
//   final Map path;
//   final double marginTop;
//   final double contentMarginBottom;
//   final double linePositionFromTop;
//   final Color? color;
//   int? itemCount;

//   CircleLine({
//     this.linePositionFromTop = 35,
//     this.contentMarginBottom = 3,
//     this.marginTop = 28,
//     required this.itemCount,
//     Key? key,
//     this.direction = Axis.vertical,
//     // required this.steps,
//     this.size = 21,
//     required this.path,
//     this.color = Colors.blue,
//   }) : super(key: key);

//   @override
//   State<CircleLine> createState() => _CircleLineState();
// }

// class _CircleLineState extends State<CircleLine> {
//   final GlobalKey _textKey = GlobalKey();
//   final _homeController = Get.put(HomeController());
//   Size? textSize;
//   getSizeAndPosition() {
//     // RenderBox _cardBox = _textKey.currentContext.findRenderObject();
//     // textSize = _textKey.currentContext.size;
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
//   }

//   @override
//   Widget build(BuildContext context) {
//     // if (textSize != null) debugPrint('text :${textSize!.height}');

//     // debugPrint("${Get.height}");
//     return Obx(
//       () => Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _homeController.successTextEditingController.isEmpty
//               ? Text('')
//               : Text(''),
//           ListView.builder(
//             //  itemExtent: 100,
//             key: _textKey,
//             padding: EdgeInsets.only(left: 15, top: 20),
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,

//             scrollDirection: widget.direction,
//             itemCount: widget.itemCount, //widget.steps.length,
//             itemBuilder: (
//               context,
//               position,
//             ) =>
//                 Padding(
//               padding: const EdgeInsets.only(bottom: 10),
//               child: Stack(
//                 children: <Widget>[
//                   Positioned(
//                     top: widget.direction == Axis.horizontal
//                         ? 7 + widget.size * 2.14 / 2 - 5 / 2
//                         : position == 0
//                             ? textSize != null
//                                 ? textSize!.height / 7
//                                 : widget.linePositionFromTop
//                             //35
//                             : 0,
//                     // bottom: widget.direction == Axis.horizontal
//                     //     ? null
//                     //     : position == widget.steps.length - 0
//                     //         ? textSize != null
//                     //             ? textSize!.height / 5
//                     //             : 0
//                     //         : position != widget.steps.lastIndexOf(widget.steps.last)
//                     //             ? 0
//                     //             : 0,
//                     left: widget.direction == Axis.horizontal ? 0 : 8,
//                     right: widget.direction == Axis.horizontal ? 0 : null,
//                     height: widget.direction == Axis.horizontal
//                         ? widget.path['width']
//                         : null,
//                     width: widget.direction == Axis.horizontal
//                         ? null
//                         : widget.path['width'],
//                     child: Container(
//                       color: widget.path['color'],
//                     ),
//                   ),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       //dot on the left
//                       // Text('$position'),
//                       Container(
//                         margin: EdgeInsets.only(
//                             right: 14.5,
//                             left: 3.2,
//                             top: textSize != null
//                                 ? textSize!.height / 11
//                                 : widget.marginTop),
//                         padding: const EdgeInsets.only(
//                             left: 2, right: 2, bottom: 2, top: 2),
//                         width: widget.size * 1.5,
//                         height: widget.size * 1.5,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             width: 0.1, color: widget.color!,
//                             //Colors.grey
//                           ),
//                           color: widget.color!,
//                           //Color(0xffDADADA),
//                           borderRadius:
//                               BorderRadius.circular(widget.size * 2.14),
//                         ),
//                         child: Container(
//                           width: widget.size * 1.0,
//                           height: widget.size * 1.0,
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               width: 1,
//                               color: widget.color!,
//                               //Colors.grey
//                             ),
//                             color: widget.color!,
//                             // widget.steps[position]['background'],
//                             borderRadius:
//                                 BorderRadius.circular(widget.size * 2.14),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                           child: GestureDetector(
//                         onTap: () {
//                           showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(bottom: 100),
//                                   child: CupertinoAlertDialog(
//                                     title: Text('Discard changes'),
//                                     content: Text(
//                                         'Are you sure you want to discard the changes you made ?'),
//                                     actions: <Widget>[
//                                       TextButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               _homeController
//                                                   .successTextEditingController
//                                                   .removeAt(position);
//                                               widget.itemCount = _homeController
//                                                   .successTextEditingController
//                                                   .length;

//                                               _homeController.update();
//                                             });
//                                             // Navigator.pop(context);
//                                             Navigator.pop(context);
//                                             //action code for "Yes" button
//                                           },
//                                           child: Text('Yes')),
//                                       TextButton(
//                                         onPressed: () {
//                                           Navigator.pop(context); //close Dialog
//                                         },
//                                         child: Text('cancel'),
//                                       )
//                                     ],
//                                   ),
//                                 );
//                               });
//                         },
//                         child: Text(
//                             '${_homeController.successTextEditingController[position].text}',
//                             textAlign: TextAlign.start),
//                       ))

//                       // widget.steps[position]['content'] != null
//                       //     ? widget.direction == Axis.horizontal
//                       //         ? Padding(
//                       //             padding: const EdgeInsets.only(top: 0),
//                       //             child: widget.steps[position]['content'],
//                       //           )
//                       //         : Expanded(
//                       //             child: Padding(
//                       //               padding: EdgeInsets.only(
//                       //                   bottom: widget.contentMarginBottom, top: 0),
//                       //               child: widget.steps[position]['content'],
//                       //             ),
//                       //           )
//                       //     : Container(),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleLine extends StatefulWidget {
  final Axis direction;
  final List steps;
  final double size;
  final Map path;
  final double marginTop;
  final double contentMarginBottom;
  final double linePositionFromTop;
  final Color? color;

  const CircleLine({
    this.linePositionFromTop = 35,
    this.contentMarginBottom = 3,
    this.marginTop = 28,
    Key? key,
    this.direction = Axis.vertical,
    required this.steps,
    this.size = 21,
    required this.path,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  State<CircleLine> createState() => _CircleLineState();
}

class _CircleLineState extends State<CircleLine> {
  final GlobalKey _textKey = GlobalKey();

  Size? textSize;
  getSizeAndPosition() {
    // RenderBox _cardBox = _textKey.currentContext.findRenderObject();
    // textSize = _textKey.currentContext.size;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
  }

  @override
  Widget build(BuildContext context) {
    if (textSize != null) debugPrint('text :${textSize!.height}');

    debugPrint("${Get.height}");
    return ListView.builder(
      //  itemExtent: 100,
      key: _textKey,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: widget.direction,
      itemCount: widget.steps.length,
      itemBuilder: (
        context,
        position,
      ) =>
          Stack(
        children: <Widget>[
          Positioned(
            top: widget.direction == Axis.horizontal
                ? 7 + widget.size * 2.14 / 2 - 5 / 2
                : position == 0
                    ? textSize != null
                        ? textSize!.height / 7
                        : widget.linePositionFromTop
                    //35
                    : 0,
            bottom: widget.direction == Axis.horizontal
                ? null
                : position == widget.steps.length - 0
                    ? textSize != null
                        ? textSize!.height / 5
                        : 0
                    : position != widget.steps.lastIndexOf(widget.steps.last)
                        ? 0
                        : 0,
            left: widget.direction == Axis.horizontal ? 0 : 8,
            right: widget.direction == Axis.horizontal ? 0 : null,
            height: widget.direction == Axis.horizontal
                ? widget.path['width']
                : null,
            width: widget.direction == Axis.horizontal
                ? null
                : widget.path['width'],
            child: Container(
              color: widget.path['color'],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //dot on the left
              Container(
                margin: EdgeInsets.only(
                    right: 14.5,
                    left: 3.2,
                    top: textSize != null
                        ? textSize!.height / 11
                        : widget.marginTop),
                padding:
                    const EdgeInsets.only(left: 2, right: 2, bottom: 2, top: 2),
                width: widget.size * 1.5,
                height: widget.size * 1.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.1, color: widget.color!,
                    //Colors.grey
                  ),
                  color: widget.color!,
                  //Color(0xffDADADA),
                  borderRadius: BorderRadius.circular(widget.size * 2.14),
                ),
                child: Container(
                  width: widget.size * 1.0,
                  height: widget.size * 1.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: widget.color!,
                      //Colors.grey
                    ),
                    color: widget.color!,
                    // widget.steps[position]['background'],
                    borderRadius: BorderRadius.circular(widget.size * 2.14),
                  ),
                ),
              ),
              widget.steps[position]['content'] != null
                  ? widget.direction == Axis.horizontal
                      ? Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: widget.steps[position]['content'],
                        )
                      : Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: widget.contentMarginBottom, top: 0),
                            child: widget.steps[position]['content'],
                          ),
                        )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}


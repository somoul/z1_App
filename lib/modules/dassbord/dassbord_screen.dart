import 'package:flutter/material.dart';

import '../../widgets/custom_default_size_web.dart';

class DassbordScreen extends StatelessWidget {
  const DassbordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDefaultSizeWeb(
      child: Scaffold(
        appBar: null,
        // appBar: AppBar(
        //   backgroundColor:  Colors.white,
        //   automaticallyImplyLeading:false,
        //   leading:Container(height:30,width: 30,color: Colors.red,child: SvgPicture.asset('asset/image/app_logo/flexi_logo_vertical.svg',height: 50,width: 50,color: Colors.black,)) ,
        //   title: const Text('Z1_APP'),
        // ),
        body: Container(
            height: double.infinity, width: double.infinity, color: Colors.red
            //
            ),
      ),
    );
  }
}

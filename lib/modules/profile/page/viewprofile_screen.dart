// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_route/auto_route.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../../widgets/custom_default_size_web.dart';
import '../controller/profile_controller.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _profileController = Get.put(ProfileController());
    return CustomDefaultSizeWeb(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: PhotoViewGallery.builder(
                  itemCount: 1,
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 5,
                      imageProvider: NetworkImage(
                        '${_profileController.profileModel.value.image_profile}',
                      ),
                    );
                  },
                  pageController: PageController(viewportFraction :1,keepPage:true,initialPage:1),
                  loadingBuilder: (context, event) => const Center(
                      child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 100),
                      child: CircularProgressIndicator(
                        value: null,
                        strokeWidth: 5.0,
                        color: Color.fromARGB(255, 101, 201, 226),
                      ),
                    ),
                  )),
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: DelayedDisplay(
                  slidingBeginOffset: const Offset(0.0, -1),
                  delay: const Duration(milliseconds: 700),
                  child: SizedBox(
                    width: 60,
                    child: IconButton(
                        onPressed: () {
                          context.router.pop();
                        },
                        icon: const Icon(
                          Icons.cancel_sharp,
                          color: Colors.white,
                          size: 40,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

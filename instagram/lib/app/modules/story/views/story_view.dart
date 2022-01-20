import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:story/story_page_view/story_page_view.dart';

import '../controllers/story_controller.dart';

class StoryView extends GetView<StoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: controller.getStories(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: SpinKitPouringHourGlassRefined(
                    color: Colors.blueAccent
                ),
              );
            }else{
              return StoryPageView(
                itemBuilder: (context, pageIndex, storyIndex) {
                  final user = controller.user.value[pageIndex];
                  final story = user.stories![storyIndex];
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Container(color: Colors.black),
                      ),
                      Positioned.fill(
                        child: Image.network(
                          story.image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.05392156862, left: Get.height * 0.00980392156),
                        child: Row(
                          children: [
                            Container(
                              height: Get.height * 0.03921568627,
                              width: Get.height * 0.03921568627,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(user.image!),
                                  fit: BoxFit.cover,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              user.username!,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                gestureItemBuilder: (context, pageIndex, storyIndex) {
                  return Stack(children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.03921568627),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          color: Colors.white,
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ]);
                },
                indicatorAnimationController: controller.indicatorAnimationController,
                initialStoryIndex: (pageIndex) {
                  return 0;
                },
                pageLength: controller.user.length,
                storyLength: (int pageIndex) {
                  return controller.user.value[pageIndex].stories!.length;
                },
                onPageLimitReached: () {
                  Get.back();
                },
              );
            }
          }
      ),
    );
  }
}

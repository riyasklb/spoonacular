import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class BodyContainerArcWidget extends StatelessWidget {
  const BodyContainerArcWidget({
    super.key,
    required this.titleText,
    required this.child,
    this.isActionNeeded = false,
    this.isFlexibleSpaceNeeded = false,
    this.isLeadingNeeded = false,
    this.actions,
    this.flexibleSpace,
    this.toolBarHeight,
    this.leadingIconColor = Colors.white,
  });
  final String titleText;
  final Widget child;
  final double? toolBarHeight;
  final bool isActionNeeded;
  final bool isFlexibleSpaceNeeded;
  final bool isLeadingNeeded;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final Color leadingIconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: Colors.orange,
          child: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.grey,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              titleText,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            leading: isLeadingNeeded
                ? IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back),
                  )
                : const SizedBox(),
            actions: isActionNeeded ? actions : [],
            flexibleSpace: isFlexibleSpaceNeeded
                ? flexibleSpace
                : PreferredSize(
                    preferredSize: Size(
                      0,
                      0,
                    ),
                    child: const SizedBox(),
                  ),
          ),
        ),
        Positioned.fill(
          top: MediaQuery.of(context).padding.top + (100),
          child: Container(
            height: 1,
            width: 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  20,
                ),
                topRight: Radius.circular(
                  20,
                ),
              ),
              color: Colors.white,
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}

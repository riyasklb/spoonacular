import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

mixin AppConstants {
  // static showLoader({
  //   required BuildContext context,
  // }) {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return Center(
  //         child: Container(
  //             height: 50,
  //             width: 260,
  //             alignment: Alignment.center,
  //             decoration: BoxDecoration(
  //               color: Colors.transparent,
  //               borderRadius: BorderRadius.circular(
  //                 10,
  //               ),
  //             ),
  //             child: const CircularProgressIndicator(
  //               strokeWidth: 4,
  //               color: AppColors.primaryColor,
  //             )),
  //       );
  //     },
  //   );
  // }

  // static showSnackbar({
  //   required String headText,
  //   required String content,
  //   required SnackPosition position,
  //   int duration = 2500,
  // }) {
  //   Get.closeAllSnackbars();
  //   return Get.snackbar(
  //     headText,
  //     content,
  //     duration: Duration(
  //       milliseconds: duration,
  //     ),
  //     snackPosition: position,
  //   );
  // }

  // // static showWebErrorSnackbar({
  // //   required String headText,
  // // }) {
  // //   Get.closeAllSnackbars();
  // //   return Get.rawSnackbar(
  // //       titleText: Text(
  // //         headText,
  // //         style: const TextStyle(color: AppColors.appBlack),
  // //       ),
  // //       messageText: const SizedBox(),
  // //       icon: const Icon(
  // //         Icons.close,
  // //         color: AppColors.primaryColorDark,
  // //       ),
  // //       maxWidth: 250,
  // //       backgroundColor: AppColors.appLightRed,
  // //       borderRadius: 5,
  // //       borderColor: AppColors.primaryColorDark,
  // //       snackPosition: SnackPosition.TOP,
  // //       margin: EdgeInsets.only(
  // //           top: 35,
  // //           left: WidgetsBinding.instance.platformDispatcher.views.first
  // //                   .physicalSize.width -
  // //               400),
  // //       dismissDirection: DismissDirection.horizontal,
  // //       leftBarIndicatorColor: AppColors.primaryColorDark);
  // // }
  // //
  // // static showWebSuccessSnackbar({
  // //   required String headText,
  // // }) {
  // //   Get.closeAllSnackbars();
  // //   return Get.rawSnackbar(
  // //       titleText: Text(
  // //         headText,
  // //         style: const TextStyle(color: AppColors.appBlack),
  // //       ),
  // //       messageText: const SizedBox(),
  // //       icon: const Icon(
  // //         Icons.check,
  // //         color: Colors.green,
  // //       ),
  // //       maxWidth: 250,
  // //       backgroundColor: AppColors.appLightRed,
  // //       borderRadius: 5,
  // //       borderColor: Colors.green,
  // //       snackPosition: SnackPosition.TOP,
  // //       margin: EdgeInsets.only(
  // //           top: 35,
  // //           left: WidgetsBinding.instance.platformDispatcher.views.first
  // //                   .physicalSize.width -
  // //               400),
  // //       dismissDirection: DismissDirection.horizontal,
  // //       leftBarIndicatorColor: Colors.green);
  // // }

  // static showWebSuccessSnackbar({
  //   required String headText,
  // }) {
  //   return snackBarKey.currentState?.showSnackBar(SnackBar(
  //       margin: EdgeInsets.only(
  //         top: 35,
  //         right: 35,
  //         left: WidgetsBinding
  //                 .instance.platformDispatcher.views.first.physicalSize.width -
  //             400,
  //         bottom: WidgetsBinding
  //                 .instance.platformDispatcher.views.first.physicalSize.height -
  //             kToolbarHeight -
  //             50,
  //       ),
  //       padding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 20),
  //       behavior: SnackBarBehavior.floating,
  //       backgroundColor: AppColors.appLightRed,
  //       elevation: 0,
  //       shape: RoundedRectangleBorder(
  //           side: const BorderSide(color: Colors.green, width: 0.5),
  //           borderRadius: BorderRadius.circular(10)),
  //       content: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Container(
  //             height: 60,
  //             width: 4,
  //             color: Colors.green,
  //           ),
  //           const SizedBox(width: 15),
  //           const Icon(
  //             Icons.check,
  //             color: Colors.green,
  //           ),
  //           const SizedBox(width: 10),
  //           Text(
  //             headText,
  //             style: const TextStyle(color: AppColors.appBlack, fontSize: 17),
  //           )
  //         ],
  //       )));
  // }

  // static showWebErrorSnackbar({
  //   required String headText,
  // }) {
  //   return snackBarKey.currentState?.showSnackBar(SnackBar(
  //       margin: EdgeInsets.only(
  //         top: 35,
  //         right: 35,
  //         left: WidgetsBinding
  //                 .instance.platformDispatcher.views.first.physicalSize.width -
  //             400,
  //         bottom: WidgetsBinding
  //                 .instance.platformDispatcher.views.first.physicalSize.height -
  //             kToolbarHeight -
  //             50,
  //       ),
  //       padding: const EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 20),
  //       behavior: SnackBarBehavior.floating,
  //       backgroundColor: AppColors.appLightRed,
  //       elevation: 0,
  //       shape: RoundedRectangleBorder(
  //           side:
  //               const BorderSide(color: AppColors.primaryColorDark, width: 0.5),
  //           borderRadius: BorderRadius.circular(10)),
  //       content: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Container(
  //             height: 60,
  //             width: 4,
  //             color: AppColors.primaryColorDark,
  //           ),
  //           const SizedBox(width: 15),
  //           const Icon(
  //             Icons.close,
  //             color: AppColors.primaryColorDark,
  //           ),
  //           const SizedBox(width: 10),
  //           Flexible(
  //             child: Text(
  //               headText,
  //               maxLines: 5,
  //               overflow: TextOverflow.ellipsis,
  //               style: const TextStyle(color: AppColors.appBlack, fontSize: 17),
  //             ),
  //           )
  //         ],
  //       )));
  // }

  static void disposeKeyboard() {
    return FocusManager.instance.primaryFocus?.unfocus();
  }

  // static Widget divider() => const Divider(
  //       height: 1,
  //       color: AppColors.appLightGray,
  //     );
}

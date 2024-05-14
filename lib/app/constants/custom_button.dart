import 'dart:io';

import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key,
    required this.onTap,
    required this.text,
    required this.borderSideColor,
    required this.textColor,
    required this.textFontSize,
    required this.bgColor,
    this.height,
    this.width,
  });
  final VoidCallback onTap;
  final String text;
  final Color borderSideColor;
  final Color bgColor;
  final Color textColor;
  final double textFontSize;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? (Platform.isAndroid ? 45 : 35),
      width: width ?? 1,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          overlayColor: const MaterialStatePropertyAll<Color>(
            Colors.transparent,
          ),
          elevation: const MaterialStatePropertyAll<double>(
            0,
          ),
          shadowColor: const MaterialStatePropertyAll<Color>(
            Colors.white,
          ),
          backgroundColor: MaterialStatePropertyAll<Color>(
            bgColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                35,
              ),
              side: BorderSide(
                color: borderSideColor,
                width: 1.5,
              ),
            ),
          ),
        ),
        child: Text(
          text,
          textScaler: const TextScaler.linear(
            1,
          ),
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: textFontSize,
                color: textColor,
              ),
        ),
      ),
    );
  }
}


// class CustomAppButton extends StatelessWidget {
//   const CustomAppButton(
//       {super.key,
//       required this.backGroundColor,
//       required this.borderColor,
//       required this.textColor,
//       required this.buttonText,
//       required this.onTap});
//   final Color backGroundColor;
//   final Color borderColor;
//   final Color textColor;
//   final String buttonText;
//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//           width: 330.w,
//           height: 48.h,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               color: backGroundColor,
//               border: Border.all(color: borderColor),
//               borderRadius: BorderRadius.circular(25.r)),
//           child: Text(buttonText,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 20.sp,
//                   fontWeight: FontWeight.bold,
//                   color: textColor))),
//     );
//   }
// }
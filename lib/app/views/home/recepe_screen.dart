// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:spoonacular/app/controllers/home_contoller.dart';

// class RecepeScreen extends StatefulWidget {
//   const RecepeScreen({super.key});

//   @override
//   State<RecepeScreen> createState() => _RecepeScreenState();
// }

// class _RecepeScreenState extends State<RecepeScreen> {
//   // final controller = Get.find<HomeController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ListView.builder(
//             // physics: BouncingScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: controller.getrecepelistData.length,
//             itemBuilder: ((context, index) {
//               return Container(
//                 child: Text(controller.getrecepelistData[index].title),
//               );
//             }))
//         //Column(
//         //children: [
//         //Text('data')
//         // Padding(
//         //   padding: EdgeInsets.only(
//         //     bottom: 15,
//         //   ),
//         //   child: GestureDetector(
//         //     // onTap: onTap,
//         //     child: Container(
//         //       height: 210,
//         //       width: 1,
//         //       alignment: Alignment.bottomLeft,
//         //       decoration: BoxDecoration(
//         //         borderRadius: BorderRadius.circular(
//         //           15,
//         //         ),
//         //         // image: DecorationImage(
//         //         //   image: isAssetImage
//         //         //       ? AssetImage(
//         //         //           image,
//         //         //         )
//         //         //       : CachedNetworkImageProvider(
//         //         //           image,
//         //         //         ) as ImageProvider,
//         //         //   fit: BoxFit.cover,
//         //         // ),
//         //       ),
//         //       child: Stack(
//         //         clipBehavior: Clip.none,
//         //         children: [
//         //           //    Positioned(
//         //           //      bottom: -10,
//         //           //     left: 0,
//         //           //     right: 0,
//         //           // child: SvgPicture.asset(
//         //           //   Assets.images.bottomNavigationBar.bottomHighlight,
//         //           //   width: 1,
//         //           //   colorFilter: ColorFilter.mode(
//         //           //     AppColors.appBlack.withOpacity(0.9),
//         //           //     BlendMode.srcIn,
//         //           //   ),
//         //           // ),
//         //           //  ),
//         //           Column(
//         //             mainAxisAlignment: MainAxisAlignment.end,
//         //             crossAxisAlignment: CrossAxisAlignment.start,
//         //             children: [
//         //               Padding(
//         //                 padding: EdgeInsets.only(
//         //                   left: 20,
//         //                   right: 20,
//         //                   bottom: 5,
//         //                 ),
//         //                 child: Row(
//         //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //                   crossAxisAlignment: CrossAxisAlignment.end,
//         //                   children: [
//         //                     Flexible(
//         //                       child: Padding(
//         //                         padding: EdgeInsets.only(
//         //                           right: 10,
//         //                         ),
//         //                         child: Text(
//         //                           'data',
//         //                           style: Theme.of(context)
//         //                               .textTheme
//         //                               .displayMedium!
//         //                               .copyWith(
//         //                                 fontSize: 18,
//         //                                 color: Colors.white,
//         //                                 fontWeight: FontWeight.bold,
//         //                               ),
//         //                         ),
//         //                       ),
//         //                     ),
//         //                     CircleAvatar(
//         //                       radius: 17,
//         //                       backgroundColor: Colors.white,
//         //                       // child: LikeButton(
//         //                       //   likeBuilder: (isLiked) {
//         //                       //     return isLiked
//         //                       //         ? Icon(
//         //                       //             Icons.favorite,
//         //                       //             size: 24,
//         //                       //             color: Colors.grey,
//         //                       //           )
//         //                       //         : Icon(
//         //                       //             Icons.favorite,
//         //                       //             size: 24,
//         //                       //             color: Colors.grey,
//         //                       //           );
//         //                       //   },
//         //                       //   isLiked: isLiked,
//         //                       //   onTap: likeTap,
//         //                       //   animationDuration: Duration.zero,
//         //                       //   countPostion: CountPostion.top,
//         //                       // ),
//         //                     ),
//         //                   ],
//         //                 ),
//         //               ),
//         //               SizedBox(
//         //                 height: 10,
//         //               ),
//         //               Padding(
//         //                 padding: EdgeInsets.only(
//         //                   left: 10,
//         //                   right: 10,
//         //                   bottom: 15,
//         //                 ),
//         //                 child: Row(
//         //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //                   children: [
//         //                     Row(
//         //                       mainAxisAlignment:
//         //                           MainAxisAlignment.spaceBetween,
//         //                       children: [
//         //                         Row(
//         //                           children: [
//         //                             // Image.asset(
//         //                             //   Assets.icons.pantryIcon.path,
//         //                             //   height: 16,
//         //                             // ),
//         //                             SizedBox(
//         //                               width: 10,
//         //                             ),
//         //                             Text(
//         //                               "data",
//         //                               style: Theme.of(context)
//         //                                   .textTheme
//         //                                   .displayMedium!
//         //                                   .copyWith(
//         //                                     fontSize: 14,
//         //                                     color: Colors.white,
//         //                                     fontWeight: FontWeight.bold,
//         //                                   ),
//         //                             ),
//         //                           ],
//         //                         ),
//         //                         SizedBox(
//         //                           width: 20,
//         //                         ),
//         //                         Row(
//         //                           children: [
//         //                             // Image.asset(
//         //                             //   Assets.icons.chefIcon.path,
//         //                             //   height: 16,
//         //                             // ),
//         //                             SizedBox(
//         //                               width: 10,
//         //                             ),
//         //                             Text(
//         //                               "${5} Mins",
//         //                               style: Theme.of(context)
//         //                                   .textTheme
//         //                                   .displayMedium!
//         //                                   .copyWith(
//         //                                     fontSize: 14,
//         //                                     color: Colors.white,
//         //                                     fontWeight: FontWeight.bold,
//         //                                   ),
//         //                             ),
//         //                           ],
//         //                         ),
//         //                       ],
//         //                     ),
//         //                   ],
//         //                 ),
//         //               ),
//         //             ],
//         //           ),
//         //         ],
//         //       ),
//         //     ),
//         //   ),
//         // )
//         //   ],
//         // ),
//         );
//   }
// }

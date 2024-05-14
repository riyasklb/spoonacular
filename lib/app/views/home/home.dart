// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:spoonacular/app/constants/custom_button1.dart';
// import 'package:spoonacular/app/controllers/home_contoller.dart';
// import 'package:spoonacular/app/views/home/recepe_screen.dart';
// import 'package:svg_flutter/svg.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController searchController = TextEditingController();
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   getdata();
//   // }

//   // getdata() {
//   //   WidgetsBinding.instance.addPostFrameCallback((_) async {
//   //     await controller.getRecepe(searchitem: searchController.text);
//   //   });
//   // }

//   final controller = Get.find<HomeController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text(
//           'Search Your Favorite Recepe',
//           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//         ),
//         backgroundColor: Colors.grey[100],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               children: [
//                 Image.asset('assets/images/play_store_512.png'),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 5),
//                   child: GetBuilder<HomeController>(builder: (_) {
//                     return Container(
//                       height: 50,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: const Color.fromARGB(255, 216, 216, 216)
//                                     .withOpacity(0.5),
//                                 spreadRadius: 1,
//                                 blurRadius: 5,
//                                 offset: const Offset(0, 5))
//                           ]),
//                       child: Row(
//                         children: [
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Icon(Icons.search),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                             child: TextField(
//                               controller: searchController,
//                               decoration: InputDecoration.collapsed(
//                                 hintText: "Search",
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }),
//                 ),
//               ],
//             ),
//             Obx(
//               () => CustomElevatedButton(
//                   height: 50,
//                   width: 1,
//                   onPressed: () {
//                     controller.getRecepe(searchitem: searchController.text);
//                     // Get.to(RecepeScreen());
//                   },
//                   color: Colors.blue,
//                   textColor: Colors.white,
//                   child: controller.isLoading.isTrue
//                       ? CircularProgressIndicator()
//                       : Text('search',
//                           style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white))),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

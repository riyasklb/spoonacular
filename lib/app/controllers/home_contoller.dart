// import 'package:get/get.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:spoonacular/app/model/get_recepe_model.dart';
// import 'package:spoonacular/app/service/recepe_search_api_service.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:spoonacular/app/views/home/recepe_screen.dart';

// class HomeController extends GetxController {
//   GetRecepApiServices getrecepeApiServices = GetRecepApiServices();

//   List<Result> getrecepelistData = [];
//   getRecepe({required String searchitem}) async {
//     print(
//         '========================data==1==========${searchitem}=======================');
//     isLoading(true);
//     update();
//     dio.Response<dynamic> response =
//         await getrecepeApiServices.getRecepeApiServices(searchitem: searchitem);
//     isLoading(false);
//     update();
//     print('========================data==2===============================');

//     if (response.data == null) {
//       print(
//           '==============================no data found===========================');
//     } else {
//       print('========================data==3===============================');
//       GetRecepeModel getRecepeModel = GetRecepeModel.fromJson(response.data);
//       getrecepelistData = getRecepeModel.results;
//       Get.to(RecepeScreen());
//     }
//     update();
//   }

//   RxBool isLoading = false.obs;
// }

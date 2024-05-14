import 'dart:io';
import 'package:dio/dio.dart';

import 'package:spoonacular/app/service/baseurl.dart';

class GetRecepApiServices extends BaseApiService {
  Future getRecepeApiServices({required String searchitem}) async {
    dynamic responseJson;
    try {
      var dio = Dio();

      var response = await dio.get(
        searchrecepeURI + '${searchitem}',
        options: Options(
            headers: {
              'Accept': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! <= 500;
            }),
      );
      print("::::::::<get reCEPE>::::${searchitem}::::status code::::::::::");
      print(response.statusCode);
      print(response.data);
      responseJson = response;
    } on SocketException {
      print("no internet");
    }
    return responseJson;
  }

  dynamic returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        print("here.>>>>>>>>>>>>");
        return responseJson;
      case 400:
      // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      // throw UnauthorisedException(response.body.toString());
      case 404:
      // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
      // throw FetchDataException(
      //     'Error occured while communication with server' +
      //         ' with status code : ${response.statusCode}');
    }
  }
}

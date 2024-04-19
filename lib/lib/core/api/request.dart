
import 'package:dio/dio.dart' as dio;
import 'package:fasateen/lib/static/api.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'dart:async';


class ApiClientService extends GetxService {


  late dio.Dio _dio;

  ApiClientService() {
    dio.BaseOptions baseOptions = dio.BaseOptions(
      baseUrl: "${ApiStatic.baseUrl}",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    _dio = dio.Dio(baseOptions);
    _dio.interceptors.add(dio.LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }
  //GET....................

  Future getRequest(String url, Map<String, dynamic> params,theHeaders) async {
    log("from method");
    try {
      log("from try");
      dio.Response response = await _dio.get(
        url,
        queryParameters: params,
        options: dio.Options(headers:theHeaders),
      );
      if (response.statusCode == 400) {
        Exception("Error : ${response.data}");
        log(response.data.toString());

      }
      if (response.statusCode == 200) {
        log(response.data.toString());


      }

      log(response.data.toString());

      return response;
    } on TimeoutException {
      Exception("Timeout");
    } catch (e) {
      log(e.toString());
      if(e is dio.DioException){
        return e.response;
      }
      Exception("Something went wrong");
    }
  }
//POST...........................
  Future<dio.Response?> postRequest(String url, Map<String, dynamic>? params,
      dynamic body,theHeaders) async {
    log("from method");
    try {
      log("from try");
      log(url);

      dio.Response response = await _dio.post(
        url,
        queryParameters: params,
        data: body,
          options: dio.Options(headers:theHeaders),
      );
      log(url);
      if (response.statusCode == 400) {
        log(response.data.toString());
        Exception("Error : ${response.data["message"]}");
      }
      log(response.data.toString());

      return response;
    } on TimeoutException {

      log("TimeoutException");
    Exception("Timeout");
    } catch (e) {
      log(e.toString());
      log("Something went wrong");
      log("Something went wrong");
      if(e is dio.DioException){
        return e.response;
      }
      Exception("Something went wrong");
      }
      return null;
    }
//PUT................................
    Future putRequest(String url, Map<String, dynamic> params,
        dynamic body) async {
      try {
        dio.Response response = await _dio.put(
          url,
          queryParameters: params,
          data: body,
        );
        if (response.statusCode == 400) {
          Exception("Error : ${response.data}");
        }
/*
        print(response.data);
*/
        return response;
      } on TimeoutException {
        Exception("Timeout");
      } catch (e) {
        log(e.toString());
        Exception("Something went wrong");
      }
    }
    //PATCH..............................

    Future patchRequest(String url, Map<String, dynamic> params,
        dynamic body) async {
      try {
        dio.Response response = await _dio.patch(
          url,
          queryParameters: params,
          data: body,
        );
        if (response.statusCode == 400) {
          Exception("Error : ${response.data}");
        }
        return response;
      } on TimeoutException {
        Exception("Timeout");
      } catch (e) {
        log(e.toString());
        Exception("Something went wrong");
      }
    }
    //DELETE..........................

    Future deleteRequest(String url, Map<String, dynamic> params,
        dynamic body) async {
      try {
        dio.Response response = await _dio.delete(
          url,
          queryParameters: params,
          data: body,
        );
        if (response.statusCode == 400) {
          Exception("Error : ${response.data}");
        }
        return response;
      } on TimeoutException {
        Exception("Timeout");
      } catch (e) {
        log(e.toString());
        Exception("Something went wrong");
      }
    return null;
  }
}
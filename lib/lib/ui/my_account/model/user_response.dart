import 'package:get/get.dart';

class UserResponse<T> extends GetxService{
  bool success;
  T? data;
  String? errorMessage;
  UserResponse({this.data,this.errorMessage,this.success = false});
}
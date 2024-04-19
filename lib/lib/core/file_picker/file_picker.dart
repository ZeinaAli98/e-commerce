// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart' as dio;


class FilePickers {
  static late dio.FormData formData;
  static late dio.FormData formDataTwo;

  static var filePath;
  static var fileName;

  static Future<void> filePicker() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;

    final file = result.files.first;
    fileName = file.name;
    filePath = file.path!;

    formData = dio.FormData();
    formData.files.add(
      MapEntry(
        'attachment',
        await dio.MultipartFile.fromFile(
          filePath,
          filename: fileName,
        ),));
     formDataTwo = dio.FormData();
      formDataTwo.files.add(
      MapEntry(
      'image',
      await dio.MultipartFile.fromFile(
        filePath,
        filename: fileName,
      ),
    ));
  }
}
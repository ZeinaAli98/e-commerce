import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width*0.4472222,
      height: Get.height*0.2039295,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            13,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          // Image border
          child: SizedBox.fromSize(
            child: Image.network(image,
                errorBuilder: (context, error, stackTrace) {
              return const Text("hello");
            }, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

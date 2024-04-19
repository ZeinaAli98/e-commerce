import 'package:flutter/material.dart';

class NotificationImageContainer extends StatelessWidget {
  const NotificationImageContainer({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        right: 10,
        left: 10,
        bottom: 27,
      ),
      width: 63,
      height: 63,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        // Image border
        child: SizedBox.fromSize(
          child: Image.network(image, errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return const Center(child: Text('No Picture'));
          }, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

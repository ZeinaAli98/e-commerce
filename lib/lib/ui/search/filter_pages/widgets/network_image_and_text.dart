
import 'package:fasateen/lib/static/app_color.dart';
import 'package:flutter/material.dart';

class NetworkImageAndText extends StatelessWidget {
  const NetworkImageAndText({
    super.key, this.imageAsset, this.text,
  });
  final String? imageAsset;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 42,
          height: 42,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              imageAsset ?? "",fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 17,
        ),
        Text(
          text ?? "",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(
              color: AppColor.textBodyColor,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

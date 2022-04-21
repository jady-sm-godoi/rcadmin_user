import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  final double imageWidth;
  final double marginWidth;
  final double imageHeight;
  final double marginHeight;

  const ProfileImage(
      {Key? key,
      required this.imageUrl,
      required this.imageWidth,
      required this.marginWidth,
      required this.imageHeight,
      required this.marginHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: marginWidth,
          height: marginHeight,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
                spreadRadius: -1,
              ),
            ],
          ),
        ),
        Container(
          width: imageWidth,
          height: imageHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
      ],
    );
  }
}

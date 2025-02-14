import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String doctorImage;
  double? width;
  double? height;
  CachedImage({
    Key? key,
    required this.doctorImage,
    this.width,
    this.height,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: doctorImage,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(strokeWidth: 0.5,),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
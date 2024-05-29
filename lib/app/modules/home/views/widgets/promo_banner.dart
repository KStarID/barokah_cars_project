import 'package:flutter/material.dart';

class BaroRoundedImage extends StatelessWidget {
  const BaroRoundedImage({
    super.key, 
    this.width, 
    this.height, 
    required this.imageurl, 
    this.applyImageRadius = true, 
    this.border, 
    this.backgroundColor = Colors.white, 
    this.fit = BoxFit.contain, 
    this.padding, 
    this.isNetworkingImage = false, 
    this.onPressed, 
    this.borderRadius = 16,
  });
  final double? width, height;
  final String imageurl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkingImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: Image(fit: fit, image: isNetworkingImage ? NetworkImage(imageurl) : AssetImage(imageurl) as ImageProvider)),
      ),
    );
  }
}
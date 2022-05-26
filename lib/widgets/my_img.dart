import 'package:cached_network_image/cached_network_image.dart';
import 'package:devnology_test/config/theme.dart';
import 'package:devnology_test/widgets/my_progress_indicator.dart';
import 'package:flutter/material.dart';

class MyImg {
  static Widget circleAvatarURL({
    required String url,
    required Key? key,
    double? radius,
  }) {
    return CachedNetworkImage(
      imageUrl: url,
      key: key!,
      placeholder: (context, url) =>
          CircleAvatar(radius: radius, child: customProgress()),
      errorWidget: (context, url, error) => CircleAvatar(
          radius: radius, child: const Icon(Icons.error, color: Colors.red)),
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: radius,
        backgroundImage: imageProvider,
        backgroundColor: AppTheme.primaryColor.withOpacity(.2),
      ),
    );
  }

  static Widget imgURL({
    required String url,
    required Key? key,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
  }) {
    return CachedNetworkImage(
      imageUrl: url,
      key: key!,
      placeholder: (context, url) => Container(
          margin: margin,
          width: width,
          height: height,
          child: customProgress()),
      errorWidget: (context, url, error) => Container(
          margin: margin,
          width: width,
          height: height,
          child: const Icon(Icons.error, color: Colors.red)),
      imageBuilder: (context, imageProvider) => Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
          ),
        ),
      ),
    );
  }
}

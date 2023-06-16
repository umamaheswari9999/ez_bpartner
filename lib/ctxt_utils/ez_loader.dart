import 'package:ez_flutter/constants/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EZInternalLoader extends StatelessWidget {
  const EZInternalLoader({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Center(
        child: Transform.scale(
          scale: 0.3,
          child: Lottie.asset(ImagePaths.ezloader),
        ),
      ),
    );
  }
}

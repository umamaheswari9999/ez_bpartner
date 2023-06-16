import 'package:ez_flutter/constants/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingOverlay {
  BuildContext _context;

  void hide() => Navigator.of(_context).pop();

  void show() {
    showDialog(
      context: _context,
      
      barrierDismissible: false,
      builder: (ctx) => _FullScreenLoader(),
    );
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
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

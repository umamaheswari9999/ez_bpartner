import 'package:ez_flutter/constants/image_paths.dart';
import 'package:flutter/material.dart';

class EZSplashScreen extends StatefulWidget {
  const EZSplashScreen({Key? key}) : super(key: key);


  @override
  State<EZSplashScreen> createState() => _EZSplashScreenState();
}

class _EZSplashScreenState extends State<EZSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();

    animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _fadeInFadeOut = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(animation);

    animation
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animation.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animation.forward();
        }
      })
      ..forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeInFadeOut,
              child: Image.asset(ImagePaths.logo,
                key: const Key('app-logo'),
                fit: BoxFit.contain,
                width: 250,
                height: 250,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

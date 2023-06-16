import 'package:ez_flutter/constants/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    Key? key,
    required this.message,
    this.graphicPath = ImagePaths.voidIcon,
    required this.onRefresh,
  }) : super(key: key);

  final String message;
  final String graphicPath;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            graphicPath,
            height: 140,
            width: 140,
            semanticsLabel: 'Empty List',
          ),
          const SizedBox(height: 32),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: onRefresh,
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
              elevation: 0,
            ),
            child: Text(
              'REFRESH',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: Colors.white,
                    letterSpacing: 2,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

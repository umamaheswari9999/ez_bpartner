import 'package:ez_flutter/constants/templates.dart';
import 'package:flutter/material.dart';
import 'package:ez_flutter/constants/image_paths.dart';

class PinHoldWidget extends StatelessWidget {
  const PinHoldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      leading: Image.asset(
        ImagePaths.holdicon,
        height: 32,
        width: 32,
      ),
      title: Text(
        Templates.pincodeHoldMessage,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12),
      ),
    );
  }
}

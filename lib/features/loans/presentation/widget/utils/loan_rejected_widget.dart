import 'package:ez_flutter/constants/image_paths.dart';
import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/shared/model/app_static_data.dart';
import 'package:ez_flutter/utils/launcher_utils.dart';
import 'package:flutter/material.dart';

class LoanRejectedWidget extends StatelessWidget {
  const LoanRejectedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final staticData = locator.get<AppStaticData>();
    return Card(
      margin: const EdgeInsets.only(top: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade400),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(ImagePaths.rejected, height: 32, width: 32),
                const Flexible(
                  child:  Text(
                    'We are unable to service this loan request...!\nPlease contact operations team at',
                    textAlign: TextAlign.center,
                    maxLines: null,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () async =>
                  await connectToCustomerCare(staticData.contactUsNumber),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.phone, color: Colors.blue),
                  Text(staticData.contactUsNumber),
                ],
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () async => await launchEmailTo(staticData.contactUsNumber),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.mail, color: Colors.blue),
                  Text(staticData.contactUsEmail),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

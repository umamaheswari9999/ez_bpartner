import 'package:ez_flutter/utils/launcher_utils.dart';
import 'package:ez_flutter/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TeamHelpWidget extends StatelessWidget {
  const TeamHelpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Get help from our team,reach us at',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontSize: 16,
                ),
          ),
          VerticalSpacing.medium,
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async => await connectToCustomerCare('8048130688'),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const [
                    Icon(
                      Icons.call,
                      size: 18,
                    ),
                    Text('+91- 8048130688'),
                  ],
                ),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Icon(
                    Icons.mail,
                    size: 18,
                    color: Colors.blue,
                  ),
                  Text('  partners@ezfinanz.com'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

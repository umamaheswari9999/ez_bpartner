import 'package:ez_flutter/di/injection.dart';
import 'package:ez_flutter/features/auth/domain/entity/user.dart';
import 'package:ez_flutter/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:ez_flutter/share_qr/mobile_qr_share.dart';
import 'package:ez_flutter/share_qr/share_qr.dart';
import 'package:ez_flutter/utils/launcher_utils.dart';
import 'package:ez_flutter/shared/locator.dart';
import 'package:ez_flutter/shared/model/app_static_data.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = getLoggedInUser();
    final appStaticData = locator.get<AppStaticData>();
    final trailingTextStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        );
    final qrData =
        '${appStaticData.qrCodeBaseUrl}?bp_id=${user.businessPartnerId}&bp_add=${user.businessPartnerAddressId}';

    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (user.businessPartnerId != null &&
                  user.businessPartnerAddressId != null) ...[
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      QrImage(
                        data: qrData,
                        size: 250,
                      ),
                      CircleAvatar(
                        child: IconButton(
                          onPressed: () async => await _shareQR(context, qrData, user),
                          icon: const Icon(Icons.share),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              ListTile(
                leading: CircleAvatar(
                  // radius: 14,
                  child: Text(user.name.characters.first),
                ),
                title: Text(
                  user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(user.organizationName),
              ),
              if (user.businessPartnerAddressName != null) ...[
                const Divider(indent: 64),
                ListTile(
                  leading: const Icon(FeatherIcons.home),
                  title: Text(
                    user.businessPartnerAddressName!,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
              const Divider(indent: 64),
              ListTile(
                onTap: () async => await launchUrl(appStaticData.faqUrl),
                leading: const Icon(FeatherIcons.helpCircle),
                title: const Text('Business Partner FAQ\'s'),
              ),
              const Divider(indent: 64),
              ListTile(
                leading: const Icon(FeatherIcons.checkSquare),
                onTap: () async => await launchUrl(appStaticData.tandcUrl),
                title: const Text('Terms & Conditions'),
              ),
              const Divider(indent: 64),
              ListTile(
                leading: const Icon(FeatherIcons.smartphone),
                title: Text(
                  'App Version',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final packageInfo = snapshot.data!;
                      final version = packageInfo.version;
                      final buildNumber = packageInfo.buildNumber;
                      return Text('$version ($buildNumber)',
                          style: trailingTextStyle,
                        );
                    }
                    return const Text('NA');
                  },
                ),
              ),
              const Divider(indent: 64),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    BlocProvider.of<AuthCubit>(context).loggedOut();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    shadowColor: const Color(0x7040BFFF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'LOGOUT',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _shareQR(BuildContext context, String qrData, User user) async {
    await MobileQRShare().share(qrData, user.name.replaceAll(" ", "_"));
  }
}

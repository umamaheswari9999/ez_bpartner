import 'package:ez_flutter/share_qr/share_qr.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:universal_io/io.dart' as io;
import 'package:universal_io/io.dart';

class MobileQRShare implements ShareQRUseCase {
  @override
  Future<void> share(String data, String fileName) async {
    var qrPainter = QrPainter(
      data: data,
      version: QrVersions.auto,
      gapless: true,
      emptyColor: Colors.white,
    );

    final imageData = await qrPainter.toImageData(250);
    final fileBytes = imageData!.buffer.asUint8List(imageData.offsetInBytes, imageData.lengthInBytes);

    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/$fileName.png';
    File imgFile = File(filePath);
    await imgFile.writeAsBytes(fileBytes);

    final xFile = XFile(filePath, mimeType: 'image/png');

    if (io.Platform.isAndroid) {
      await Share.shareXFiles(
        [xFile],
        subject: 'Scan to apply for a consumer loan',
      );
    } else {
      await Share.shareXFiles([xFile]);
    }
  }
}

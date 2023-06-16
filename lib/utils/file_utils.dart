import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';
import 'dart:typed_data';

class FileUtils {
  static Future<File> saveInTemp(Uint8List data, String filename,{String? type}) async {
    final directory = await getApplicationDocumentsDirectory();
    late File file;
    if (type != null) {
      file = File('${directory.path}/Dir/$filename.$type');
    } else {
      file = File('${directory.path}/Dir/$filename');
    }
    if (await file.exists()) {
      await file.delete();
    }
    await file.create(recursive: true);
    return await file.writeAsBytes(data);
  }
}

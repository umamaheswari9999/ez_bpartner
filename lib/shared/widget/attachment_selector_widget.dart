import 'dart:io';

import 'package:camera/camera.dart';
import 'package:ez_flutter/shared/widget/camera_widget.dart';
import 'package:flutter/foundation.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

class AttachmentSelectorInputField extends StatefulWidget {
  final String title;
  final String? fileName;
  final Function(PlatformFile file, String path) onAttachmentSelected;

  const AttachmentSelectorInputField({
    Key? key,
    required this.title,
    required this.onAttachmentSelected,
    this.fileName,
  }) : super(key: key);

  @override
  _AttachmentSelectorInputFieldState createState() =>
      _AttachmentSelectorInputFieldState();
}

class _AttachmentSelectorInputFieldState extends State<AttachmentSelectorInputField> {
  PlatformFile? _selectedFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.title.toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 8),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(color: Colors.grey),
          ),
          onTap: _startAttachmentSelectionFlow,
          contentPadding: EdgeInsets.zero,
          title: Text(
            _selectedFile == null ? 'Select File' : _selectedFile?.name ?? 'NA',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          leading: _selectedFile == null
              ? const SizedBox(width: 64, child: Icon(Icons.upload_file))
              : SizedBox(
                  width: 64,
                  child: Image.memory(
                    _selectedFile!.bytes!,
                    fit: BoxFit.fill,
                  ),
                ),
          trailing: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.attachment),
          ),
        ),
      ],
    );
  }

  void _closeBottomSheet() => Navigator.of(context).pop();

  Future<void> _handleFileSelection(PlatformFile selectedFile) async {
    widget.onAttachmentSelected(selectedFile, selectedFile.name);
    setState(() {
      _selectedFile = selectedFile;
    });
  }

  void _startAttachmentSelectionFlow() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // if (!kIsWeb) ...[
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      _closeBottomSheet();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CameraWidget(),
                        ),
                      ).then((value) async {
                        if (value == null) return;
                        try {
                          final selectedFile = value as XFile;
                          final size = (await File(selectedFile.path).readAsBytes()).length;
                          final pfile = PlatformFile(
                            bytes: await selectedFile.readAsBytes(),
                            name: 'PAN',
                            size: size,
                          );
                          if (!mounted) return;
                          _handleFileSelection(pfile);
                        } catch (e, st) {
                          print(e);
                          print(st);
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(Icons.camera),
                          SizedBox(height: 8),
                          Text('Camera')
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      _closeBottomSheet();
                      final selectedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if (selectedFile == null) return;
                      final size = (await File(selectedFile.path).readAsBytes()).length;
                      final pfile = PlatformFile(
                        bytes: await selectedFile.readAsBytes(),
                        name: 'PAN',
                        size: size,
                      );
                      if (!mounted) return;
                      _handleFileSelection(pfile);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(Icons.image),
                          SizedBox(height: 8),
                          Text('Gallery')
                        ],
                      ),
                    ),
                  ),
                ),
                // ],
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      _closeBottomSheet();
                      final result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowMultiple: false,
                        withData: true,
                        allowedExtensions: ["jpg", "png", "jpeg"],
                      );
                      if (!mounted) return;
                      if (result != null || (result!.files.isNotEmpty)) {
                        _handleFileSelection(result.files.first);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(Icons.smartphone),
                          SizedBox(height: 8),
                          Text('Phone'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

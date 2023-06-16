import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({Key? key}) : super(key: key);

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late List<CameraDescription> _cameras;
  late CameraController controller;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCameras();
    });
  }

  void _getCameras() async {
    _cameras = await availableCameras();
    setState(() {});
    controller = CameraController(_cameras.first, ResolutionPreset.max);
    await controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!controller.value.isInitialized) ...[
            const CircularProgressIndicator()
          ] else ...[
            Flexible(
              flex: 8,
              child: _cameraPreviewWidget(),
            ),
            Expanded(child: _cameraControlWidget(context)),
          ],
        ],
      ),
    );
  }

  Widget _cameraPreviewWidget() {
    if (!controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }

  Widget _cameraControlWidget(context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () => _onCapturePressed(context),
              child: const Icon(
                Icons.camera,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onCapturePressed(context) async {
    final file = await controller.takePicture();
    Navigator.of(context).pop(file);
  }
}

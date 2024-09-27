import 'dart:io';

import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/features/home/widgets/reached_pickup_sheet.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CameraPage extends StatefulWidget {
  const CameraPage.builder(BuildContext context, GoRouterState state,
      {super.key});

  static const path = "camera_path";
  static const name = "camera";

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;
  XFile? takenPicture;
  final List<CameraDescription>? cameras = [
    const CameraDescription(
        name: "0",
        lensDirection: CameraLensDirection.front,
        sensorOrientation: 0),
    const CameraDescription(
        name: "1",
        lensDirection: CameraLensDirection.back,
        sensorOrientation: 0)
  ];

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(cameras![1]);
  }

  Future<void> takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return;
    }
    if (_cameraController.value.isTakingPicture) {
      return;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      setState(() {
        takenPicture = picture;
      });
    } on CameraException catch (e) {
      debugPrint('Error occurred while taking picture: $e');
    }
  }

  Future<void> initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FA),
      body: Stack(
        children: [
          if (takenPicture != null)
            Image.file(
              File(takenPicture!.path),
              fit: BoxFit.cover,
            )
          else if (_cameraController.value.isInitialized)
            CameraPreview(
              _cameraController,
            )
          else
            Container(
              color: Colors.black,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 109,
              color: const Color(0xffF8F8FA),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 30,
                      icon: OnestText(
                        "Retake",
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.hintDarkGrey,
                      ),
                      onPressed: () {
                        setState(() {
                          takenPicture = null;
                        });
                        takePicture();
                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: takePicture,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryWhite,
                          border: Border.all(
                            color: const Color(0xffE5E7EB),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 30,
                      icon: OnestText(
                        "Submit",
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryBlue,
                      ),
                      onPressed: () {
                        context.pop();
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => const ReachedPickupSheet(
                            isTagDelivered: true,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

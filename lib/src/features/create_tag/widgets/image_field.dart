import 'dart:io';

import 'package:abiola_along_client_app/src/const/assets.dart';
import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:abiola_along_client_app/src/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ImageFieldCreateTag extends ConsumerStatefulWidget {
  const ImageFieldCreateTag({
    super.key,
    required this.onImageSelect,
    required this.packageImage,
  });

  final String? packageImage;
  final Function(XFile file) onImageSelect;

  @override
  ConsumerState createState() => _ImageFieldCreateTagState();
}

class _ImageFieldCreateTagState extends ConsumerState<ImageFieldCreateTag> {
  XFile? file;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        imageSelection();
      },
      child: Container(
        padding: file != null && file!.path.isNotEmpty
            ? EdgeInsets.zero
            : const EdgeInsets.only(left: 20, top: 16, bottom: 18, right: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          borderRadius: BorderRadius.circular(
              file != null && file!.path.isNotEmpty ? 20 : 100),
        ),
        child: file == null &&
                widget.packageImage != null &&
                widget.packageImage != '' &&
                widget.packageImage!.isNotEmpty
            ? Image.file(
                File(file!.path),
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              )
            : file != null && file!.path.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          File(file!.path),
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              file = null;
                            });
                          },
                          child: SvgPicture.asset(AppAssets.dialogCancelIcon),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OnestText("Image"),
                      SvgPicture.asset(AppAssets.uploadIcon),
                    ],
                  ),
      ),
    );
  }

  Future<void> imageSelection() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 30,
        preferredCameraDevice: CameraDevice.rear,
        maxHeight: 800,
        maxWidth: 1000,
      );
      if (image != null) {
        widget.onImageSelect(image);
        setState(() {
          file = image;
        });
      }
    } catch (e) {
      // showToastError("Couldn't select image $e", FToast().init(context));
    }
  }
}

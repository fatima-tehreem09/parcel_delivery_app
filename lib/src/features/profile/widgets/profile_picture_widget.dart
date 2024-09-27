import 'dart:io';

import 'package:abiola_along_client_app/src/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../const/assets.dart';
import '../../../widgets/cached_image.dart';
import '../../../widgets/image_picker_dialog.dart';

class ProfilePictureWidget extends ConsumerStatefulWidget {
  final String? profileImage;
  final Function(XFile file) onImageSelect;
  const ProfilePictureWidget({
    super.key,
    required this.onImageSelect,
    this.profileImage,
  });

  @override
  ConsumerState createState() => _ProfilePictureWidgetState();
}

class _ProfilePictureWidgetState extends ConsumerState<ProfilePictureWidget> {
  XFile? file;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffD1D5DB),
            ),
            child: file == null &&
                    widget.profileImage != null &&
                    widget.profileImage != '' &&
                    widget.profileImage!.isNotEmpty
                ? image(widget.profileImage!)
                : file != null && file!.path.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: image(file!.path),
                      )
                    : const Center(
                        child: Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
          ),
          Positioned(
            bottom: -10,
            right: 10,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => ImagePickerSheet(
                    name: 'Abiola Along',
                    onCameraBTNPressed: () {
                      imageSelection(ImageSource.camera);
                    },
                    onGalleryBTNPressed: () {
                      imageSelection(ImageSource.gallery);
                    },
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.primaryWhite,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(AppAssets.editIcon),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget image(String path) {
    return path.contains('http')
        ? CachedImageWidget(
            url: path,
            size: 80,
            fit: BoxFit.cover,
          )
        : Image.file(
            File(path),
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          );
  }

  Future<void> imageSelection(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(
        source: imageSource,
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

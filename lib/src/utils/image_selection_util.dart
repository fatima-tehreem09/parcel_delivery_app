// import 'package:flutter/cupertino.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ImageSelectionUtil {
//   Future<void> imageSelection(
//       BuildContext context, ImageSource imageSource, XFile? file) async {
//     try {
//       final image = await ImagePicker().pickImage(
//         source: imageSource,
//         imageQuality: 30,
//         preferredCameraDevice: CameraDevice.rear,
//         maxHeight: 800,
//         maxWidth: 1000,
//       );
//       if (image != null) {
//         widget.onImageSelect(image);
//         setState(() {
//           file = image;
//         });
//       }
//     } catch (e) {
//       // showToastError("Couldn't select image $e", FToast().init(context));
//     }
//   }
// }

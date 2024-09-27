// import 'dart:io';
//
// import 'package:url_launcher/url_launcher.dart';
//
// class MapServices {
//   static Future<void> openMap({required LocationMeta location}) async {
//     final lat = location.latitude;
//     final lng = location.longitude;
//     try {
//       var url = '';
//       var appleMaps = '';
//       if (Platform.isAndroid) {
//         url = 'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng';
//       } else {
//         url = "comgooglemaps://?saddr=&daddr=$lat,$lng&directionsmode=driving";
//         appleMaps = 'https://maps.apple.com/?q=$lat,$lng';
//       }
//       final uri = Uri.parse(url);
//       if (await canLaunchUrl(uri) || Platform.isAndroid) {
//         await launchUrl(
//           Uri.parse(url),
//           mode: LaunchMode.externalApplication,
//         );
//       } else {
//         await launchUrl(
//           Uri.parse(appleMaps),
//           mode: LaunchMode.externalApplication,
//         );
//       }
//     } catch (_) {}
//   }
// }

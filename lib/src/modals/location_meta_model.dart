// import 'package:firebase_database/firebase_database.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'location_meta_model.freezed.dart';
//
// part 'location_meta_model.g.dart';
//
// @freezed
// abstract class LocationMeta implements _$LocationMeta {
//   const LocationMeta._();
//
//   const factory LocationMeta({
//     double? latitude,
//     double? longitude,
//     String? name,
//     int? radius,
//     String? address,
//   }) = _LocationMeta;
//
//   factory LocationMeta.fromJson(Map<String, dynamic> json) =>
//       _$LocationMetaFromJson(json);
//
//   factory LocationMeta.empty() => LocationMeta();
//
//   factory LocationMeta.fromDocument(DataSnapshot doc) {
//     final data = doc as Map<String, dynamic>;
//     return LocationMeta.fromJson(data);
//   }
//
//   Map<String, dynamic> toDocument() => toJson();
// }

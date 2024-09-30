// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$$SignUpDtoImplToJson(_$SignUpDtoImpl instance) {
  final val = <String, dynamic>{
    'email': instance.email,
    'phone': instance.phone,
    'vehicle_model': instance.vehicle_model,
    'license_plate_number': instance.license_plate_number,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('password', instance.password);
  val['role'] = instance.role;
  val['status'] = instance.status;
  return val;
}

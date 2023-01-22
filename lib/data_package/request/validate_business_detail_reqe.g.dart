// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_business_detail_reqe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateBusinessDetailREQE_businesses
    _$ValidateBusinessDetailREQE_businessesFromJson(
            Map<String, dynamic> json) =>
        ValidateBusinessDetailREQE_businesses(
          b_no: json['b_no'] as String?,
          start_dt: json['start_dt'] as String?,
          p_nm: json['p_nm'] as String?,
          p_nm2: json['p_nm2'] as String?,
          b_nm: json['b_nm'] as String?,
          corp_no: json['corp_no'] as String?,
          b_sector: json['b_sector'] as String?,
          b_type: json['b_type'] as String?,
        );

Map<String, dynamic> _$ValidateBusinessDetailREQE_businessesToJson(
        ValidateBusinessDetailREQE_businesses instance) =>
    <String, dynamic>{
      'b_no': instance.b_no,
      'start_dt': instance.start_dt,
      'p_nm': instance.p_nm,
      'p_nm2': instance.p_nm2,
      'b_nm': instance.b_nm,
      'corp_no': instance.corp_no,
      'b_sector': instance.b_sector,
      'b_type': instance.b_type,
    };

ValidateBusinessDetailREQE _$ValidateBusinessDetailREQEFromJson(
        Map<String, dynamic> json) =>
    ValidateBusinessDetailREQE(
      businesses: json['businesses'] == null
          ? null
          : ValidateBusinessDetailREQE_businesses.fromJson(
              json['businesses'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ValidateBusinessDetailREQEToJson(
        ValidateBusinessDetailREQE instance) =>
    <String, dynamic>{
      'businesses': instance.businesses,
    };

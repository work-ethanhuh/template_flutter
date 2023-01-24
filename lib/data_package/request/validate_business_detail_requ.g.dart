// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_business_detail_requ.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateBusinessDetailREQU_businesses
    _$ValidateBusinessDetailREQU_businessesFromJson(
            Map<String, dynamic> json) =>
        ValidateBusinessDetailREQU_businesses(
          b_no: json['b_no'],
          start_dt: json['start_dt'],
          p_nm: json['p_nm'],
          p_nm2: json['p_nm2'],
          b_nm: json['b_nm'],
          corp_no: json['corp_no'],
          b_sector: json['b_sector'],
          b_type: json['b_type'],
        );

Map<String, dynamic> _$ValidateBusinessDetailREQU_businessesToJson(
        ValidateBusinessDetailREQU_businesses instance) =>
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

ValidateBusinessDetailREQU _$ValidateBusinessDetailREQUFromJson(
        Map<String, dynamic> json) =>
    ValidateBusinessDetailREQU(
      businesses: (json['businesses'] as List<dynamic>)
          .map((e) => ValidateBusinessDetailREQU_businesses.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ValidateBusinessDetailREQUToJson(
        ValidateBusinessDetailREQU instance) =>
    <String, dynamic>{
      'businesses': instance.businesses,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_business_detail_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateBusinessDetailRESP_data_status
    _$ValidateBusinessDetailRESP_data_statusFromJson(
            Map<String, dynamic> json) =>
        ValidateBusinessDetailRESP_data_status(
          b_no: json['b_no'] as String?,
          b_stt: json['b_stt'] as String?,
          b_stt_cd: json['b_stt_cd'] as String?,
          tax_type: json['tax_type'] as String?,
          tax_type_cd: json['tax_type_cd'] as String?,
          end_dt: json['end_dt'] as String?,
          utcc_yn: json['utcc_yn'] as String?,
          tax_type_change_dt: json['tax_type_change_dt'] as String?,
          invoice_apply_dt: json['invoice_apply_dt'] as String?,
        );

Map<String, dynamic> _$ValidateBusinessDetailRESP_data_statusToJson(
        ValidateBusinessDetailRESP_data_status instance) =>
    <String, dynamic>{
      'b_no': instance.b_no,
      'b_stt': instance.b_stt,
      'b_stt_cd': instance.b_stt_cd,
      'tax_type': instance.tax_type,
      'tax_type_cd': instance.tax_type_cd,
      'end_dt': instance.end_dt,
      'utcc_yn': instance.utcc_yn,
      'tax_type_change_dt': instance.tax_type_change_dt,
      'invoice_apply_dt': instance.invoice_apply_dt,
    };

ValidateBusinessDetailRESP_data _$ValidateBusinessDetailRESP_dataFromJson(
        Map<String, dynamic> json) =>
    ValidateBusinessDetailRESP_data(
      b_no: json['b_no'] as String?,
      valid: json['valid'] as String?,
      status: json['status'] == null
          ? null
          : ValidateBusinessDetailRESP_data_status.fromJson(
              json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ValidateBusinessDetailRESP_dataToJson(
        ValidateBusinessDetailRESP_data instance) =>
    <String, dynamic>{
      'b_no': instance.b_no,
      'valid': instance.valid,
      'status': instance.status,
    };

ValidateBusinessDetailRESP _$ValidateBusinessDetailRESPFromJson(
        Map<String, dynamic> json) =>
    ValidateBusinessDetailRESP(
      valid_cnt: json['valid_cnt'] as int?,
      request_cnt: json['request_cnt'] as int?,
      status_code: json['status_code'] as String?,
      data: json['data'] == null
          ? null
          : ValidateBusinessDetailRESP_data.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ValidateBusinessDetailRESPToJson(
        ValidateBusinessDetailRESP instance) =>
    <String, dynamic>{
      'request_cnt': instance.request_cnt,
      'valid_cnt': instance.valid_cnt,
      'status_code': instance.status_code,
      'data': instance.data,
    };

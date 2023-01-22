import 'package:json_annotation/json_annotation.dart';

part 'validate_business_detail_resp.g.dart';

@JsonSerializable()
class ValidateBusinessDetailRESP_data_status {
  String? b_no;
  String? b_stt;
  String? b_stt_cd;
  String? tax_type;
  String? tax_type_cd;
  String? end_dt;
  String? utcc_yn;
  String? tax_type_change_dt;
  String? invoice_apply_dt;

  ValidateBusinessDetailRESP_data_status({
    this.b_no,
    this.b_stt,
    this.b_stt_cd,
    this.tax_type,
    this.tax_type_cd,
    this.end_dt,
    this.utcc_yn,
    this.tax_type_change_dt,
    this.invoice_apply_dt,
  });
  factory ValidateBusinessDetailRESP_data_status.fromJson(
          Map<String, dynamic> json) =>
      _$ValidateBusinessDetailRESP_data_statusFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ValidateBusinessDetailRESP_data_statusToJson(this);
}

@JsonSerializable()
class ValidateBusinessDetailRESP_data {
  String? b_no;
  String? valid;
  ValidateBusinessDetailRESP_data_status? status;

  ValidateBusinessDetailRESP_data({
    this.b_no,
    this.valid,
    this.status,
  });
  factory ValidateBusinessDetailRESP_data.fromJson(Map<String, dynamic> json) =>
      _$ValidateBusinessDetailRESP_dataFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ValidateBusinessDetailRESP_dataToJson(this);
}

@JsonSerializable()
class ValidateBusinessDetailRESP {
  int? request_cnt;
  int? valid_cnt;
  String? status_code;
  ValidateBusinessDetailRESP_data? data;

  ValidateBusinessDetailRESP({
    this.valid_cnt,
    this.request_cnt,
    this.status_code,
    this.data,
  });

  factory ValidateBusinessDetailRESP.fromJson(Map<String, dynamic> json) =>
      _$ValidateBusinessDetailRESPFromJson(json);
  Map<String, dynamic> toJson() => _$ValidateBusinessDetailRESPToJson(this);
}

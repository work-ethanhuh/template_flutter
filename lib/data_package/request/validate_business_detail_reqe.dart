import 'package:json_annotation/json_annotation.dart';

part 'validate_business_detail_reqe.g.dart';

@JsonSerializable()
class ValidateBusinessDetailREQE_businesses {
  String? b_no;
  String? start_dt;
  String? p_nm;
  String? p_nm2;
  String? b_nm;
  String? corp_no;
  String? b_sector;
  String? b_type;

  ValidateBusinessDetailREQE_businesses({
    this.b_no,
    this.start_dt,
    this.p_nm,
    this.p_nm2,
    this.b_nm,
    this.corp_no,
    this.b_sector,
    this.b_type,
  });

  factory ValidateBusinessDetailREQE_businesses.fromJson(
          Map<String, dynamic> json) =>
      _$ValidateBusinessDetailREQE_businessesFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ValidateBusinessDetailREQE_businessesToJson(this);
}

@JsonSerializable()
class ValidateBusinessDetailREQE {
  ValidateBusinessDetailREQE_businesses? businesses;

  ValidateBusinessDetailREQE({
    this.businesses,
  });

  factory ValidateBusinessDetailREQE.fromJson(Map<String, dynamic> json) =>
      _$ValidateBusinessDetailREQEFromJson(json);
  Map<String, dynamic> toJson() => _$ValidateBusinessDetailREQEToJson(this);
}

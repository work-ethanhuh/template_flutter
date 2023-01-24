// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'validate_business_detail_requ.g.dart';

@JsonSerializable()
class ValidateBusinessDetailREQU_businesses {
  final b_no;
  final start_dt;
  final p_nm;
  final p_nm2;
  final b_nm;
  final corp_no;
  final b_sector;
  final b_type;

  ValidateBusinessDetailREQU_businesses({
    @required this.b_no,
    @required this.start_dt,
    @required this.p_nm,
    this.p_nm2,
    @required this.b_nm,
    this.corp_no,
    this.b_sector,
    this.b_type,
  });

  factory ValidateBusinessDetailREQU_businesses.fromJson(
          Map<String, dynamic> json) =>
      _$ValidateBusinessDetailREQU_businessesFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ValidateBusinessDetailREQU_businessesToJson(this);
}

@JsonSerializable()
class ValidateBusinessDetailREQU {
  List<ValidateBusinessDetailREQU_businesses> businesses = [];

  ValidateBusinessDetailREQU({
    required this.businesses,
  });

  factory ValidateBusinessDetailREQU.fromJson(Map<String, dynamic> json) =>
      _$ValidateBusinessDetailREQUFromJson(json);
  Map<String, dynamic> toJson() => _$ValidateBusinessDetailREQUToJson(this);
}

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:template_flutter/api/fixed_key.dart';
import 'package:template_flutter/common/config.dart';

class AddressPackage {
  AddressCommon? common;
  List<Juso>? jusoList;

  AddressPackage({
    this.common,
    this.jusoList,
  });

  factory AddressPackage.formJson(Map<String, dynamic> json) {
    final results = json['results'];
    final common = AddressCommon.fromJson(results['common']);
    List<Juso> jusoList = [];
    if (results['juso'] != null) {
      final jusoJsonList = results['juso'] as List;
      jusoList = jusoJsonList.map((item) => Juso.fromJson(item)).toList();
    }

    return AddressPackage(
      common: common,
      jusoList: jusoList,
    );
  }
}

class Juso {
  String? detBdNmList, engAddr, rn;
  String? emdNm, zipNo, roadAddrPart2;
  String? emdNo, sggNm, jibunAddr;
  String? siNm, roadAddrPart1, bdNm;
  String? admCd, udrtYn, lnbrMnnm;
  String? roadAddr, lnbrSlno, buldMnnm;
  String? bdKdcd, liNm, rnMgtSn;
  String? mtYn, bdMgtSn, buldSlno;

  Juso(
      {this.detBdNmList,
      this.engAddr,
      this.rn,
      this.emdNm,
      this.zipNo,
      this.roadAddrPart2,
      this.emdNo,
      this.sggNm,
      this.jibunAddr,
      this.siNm,
      this.roadAddrPart1,
      this.bdNm,
      this.admCd,
      this.udrtYn,
      this.lnbrMnnm,
      this.roadAddr,
      this.lnbrSlno,
      this.buldMnnm,
      this.bdKdcd,
      this.liNm,
      this.rnMgtSn,
      this.mtYn,
      this.bdMgtSn,
      this.buldSlno});

  factory Juso.fromJson(Map<String, dynamic> json) {
    return Juso(
      detBdNmList: json["detBdNmList"],
      engAddr: json["engAddr"],
      rn: json["rn"],
      emdNm: json["emdNm"],
      zipNo: json["zipNo"],
      roadAddrPart2: json["roadAddrPart2"],
      emdNo: json["emdNo"],
      sggNm: json["sggNm"],
      jibunAddr: json["jibunAddr"],
      siNm: json["siNm"],
      roadAddrPart1: json["roadAddrPart1"],
      bdNm: json["bdNm"],
      admCd: json["admCd"],
      udrtYn: json["udrtYn"],
      lnbrMnnm: json["lnbrMnnm"],
      roadAddr: json["roadAddr"],
      lnbrSlno: json["lnbrSlno"],
      buldMnnm: json["buldMnnm"],
      bdKdcd: json["bdKdcd"],
      liNm: json["liNm"],
      rnMgtSn: json["rnMgtSn"],
      mtYn: json["mtYn"],
      bdMgtSn: json["bdMgtSn"],
      buldSlno: json["buldSlno"],
    );
  }
}

class AddressCommon {
  String? errorMessage;
  String? countPerPage;
  String? totalCount;
  String? errorCode;
  String? currentPage;

  AddressCommon(
      {this.errorMessage,
      this.countPerPage,
      this.totalCount,
      this.errorCode,
      this.currentPage});

  factory AddressCommon.fromJson(Map<String, dynamic> json) {
    return AddressCommon(
      errorMessage: json['errorMessage'],
      countPerPage: json['countPerPage'],
      totalCount: json['totalCount'],
      errorCode: json['errorCode'],
      currentPage: json['currentPage'],
    );
  }
}

class AddressErrorModel {
  final int statusCode;
  final int error;
  final String message;

  AddressErrorModel({
    required this.statusCode,
    required this.error,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'success': false,
      'message': message,
      'data': error,
    };
  }
}

class AddressRepository {
  Future<AddressPackage> searchAddress(String query) async {
    String url = "${DefinedAPI.PUBLIC_JUSO}$query";

    final response = await http.get(Uri.parse(url));
    String bodyString = utf8.decode(response.bodyBytes);
    Map<String, dynamic> body = jsonDecode(bodyString);

    return AddressPackage.formJson(body);
  }
}

class AddressBloc {
  final AddressRepository _addressRepository = AddressRepository();

  final _addressFetcher = PublishSubject<List<Juso>>();
  Stream<List<Juso>> get address => _addressFetcher.stream;
  final List<Juso> _addressList = [];

  dispose() {
    _addressFetcher.close();
  }

  void fetchAddress(String keyword, int pageNumber) async {
    String query = '';
    query = httpGetQuery(query, "currentPage", '$pageNumber');
    query = httpGetQuery(query, "countPerPage", '10');
    query = httpGetQuery(query, "keyword", keyword);
    query = httpGetQuery(query, "confmKey", FIXEDKEY.PUBLIC_JUSO_API);
    query = httpGetQuery(query, "resultType", 'json');

    try {
      AddressPackage address = await _addressRepository.searchAddress(query);

      if (address.jusoList!.isEmpty && address.common!.errorCode == '0') {
        throw AddressErrorModel(
            statusCode: 0, error: -101, message: '검색 결과가 없습니다.');
      } else if (address.common!.errorCode != '0') {
        throw AddressErrorModel(
            statusCode: 0, error: 0, message: address.common!.errorMessage!);
      }

      if (pageNumber == 1) _addressList.clear();
      _addressList.addAll(address.jusoList!);
      _addressFetcher.sink.add(_addressList);
    } catch (e) {
      _addressFetcher.sink.addError(e);
    }
  }

  String httpGetQuery(String query, String key, String value) {
    if (value == null) {
      return query;
    }
    String firstWord = query == '' ? "?" : "$query&";
    return "$firstWord$key=$value";
  }
}

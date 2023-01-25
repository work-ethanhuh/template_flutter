import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:template_flutter/api/basic_client.dart';
import 'package:template_flutter/api/external_client.dart';
import 'package:template_flutter/data_package/request/validate_business_detail_requ.dart';
import 'package:template_flutter/data_package/response/validate_business_detail_resp.dart';
import 'package:template_flutter/util/ui_helper.dart';

// ignore: use_key_in_widget_constructors
class Exam2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Exam2State();
  }
}

class Exam2State extends State<Exam2> {
  TextEditingController registrationNumber_sta = TextEditingController();
  TextEditingController registrationNumber_mid = TextEditingController();
  TextEditingController registrationNumber_end = TextEditingController();
  String registrationNumber = '';
  TextEditingController startDate = TextEditingController();
  TextEditingController ownerName = TextEditingController();
  TextEditingController companyName = TextEditingController();
  double currentWidth = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentWidth = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    registrationNumber_sta.dispose();
    registrationNumber_mid.dispose();
    registrationNumber_end.dispose();
    startDate.dispose();
    ownerName.dispose();
    companyName.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                UIH().cBox.box_H(
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: UIH().cTex.weightText(
                              'Public Data Portal API', 20, FontWeight.w400),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                registrationNumber_sta.clear();
                                registrationNumber_mid.clear();
                                registrationNumber_end.clear();
                                startDate.clear();
                                ownerName.clear();
                                companyName.clear();
                              });
                            },
                            child: Icon(Icons.refresh),
                          ),
                        ),
                      ],
                    ),
                    currentWidth,
                    60),

                // UIH().cBox.box(UIH().cTex.text('$login_info', 10), currentWidth),

                UIH().cBox.rounded(
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          UIH().cTex.colorText('R/N : ', 20, Colors.white),
                          Container(
                            width: 50,
                            child: TextField(
                              controller: registrationNumber_sta,
                              maxLength: 3,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: '113',
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                            ),
                          ),
                          UIH().cTex.colorText(' - ', 10, Colors.white),
                          Container(
                            width: 30,
                            child: TextField(
                              controller: registrationNumber_mid,
                              maxLength: 2,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: '86',
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                            ),
                          ),
                          UIH().cTex.colorText(' - ', 10, Colors.white),
                          Container(
                            width: 80,
                            child: TextField(
                              controller: registrationNumber_end,
                              maxLength: 5,
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: '21886',
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    currentWidth,
                    80),
                UIH().cBox.rounded(
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          UIH()
                              .cTex
                              .colorText('StartDate : ', 20, Colors.white),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                controller: startDate,
                                maxLength: 8,
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: '20080530',
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    currentWidth,
                    80),
                UIH().cBox.rounded(
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          UIH()
                              .cTex
                              .colorText('OwnerName : ', 20, Colors.white),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                controller: ownerName,
                                maxLength: 10,
                                keyboardType: TextInputType.text,
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: '강창석',
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    currentWidth,
                    80),

                UIH().cBox.rounded(
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          UIH()
                              .cTex
                              .colorText('CompanyName : ', 20, Colors.white),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: TextField(
                                controller: companyName,
                                maxLength: 10,
                                keyboardType: TextInputType.text,
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: '(주)미리디',
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    currentWidth,
                    80),
                InkWell(
                  onTap: () {
                    checkValidation();
                  },
                  child: UIH().cBox.rounded(
                      UIH()
                          .cTex
                          .colorText('Check Validation', 20, Colors.white),
                      currentWidth,
                      40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  checkValidation() {
    registrationNumber = '';
    if (registrationNumber_sta.text.isEmpty &&
        registrationNumber_mid.text.isEmpty &&
        registrationNumber_end.text.isEmpty &&
        startDate.text.isEmpty &&
        ownerName.text.isEmpty &&
        companyName.text.isEmpty) {
      registrationNumber = '1138621886';
      startDate.text = '20080530';
      ownerName.text = '강창석';
      companyName.text = '(주)미리디';

      print('registrationNumber : $registrationNumber');
      print('startDate.text : ${startDate.text}');
      print('ownerName.text : ${ownerName.text}');
      print('companyName.text : ${companyName.text}');
    }

    if (registrationNumber_sta.text.isEmpty &&
        registrationNumber_mid.text.isEmpty &&
        registrationNumber_end.text.isEmpty) {}

    final request = ExternalClient(BasicClient.publicPortal);
    ValidateBusinessDetailREQU_businesses
        validateBusinessDetailREQU_businesses =
        ValidateBusinessDetailREQU_businesses(
            b_no: registrationNumber,
            start_dt: startDate.text,
            p_nm: ownerName.text,
            b_nm: companyName.text);
    List<ValidateBusinessDetailREQU_businesses> input = [];
    input.add(validateBusinessDetailREQU_businesses);
    ValidateBusinessDetailREQU validateBusinessDetailREQU =
        ValidateBusinessDetailREQU(businesses: input);

    // String body = jsonEncode({
    //   "businesses": [
    //     {
    //       "b_no": '1138621886',
    //       "start_dt": '20080530',
    //       "p_nm": '강창석',
    //       "p_nm2": '',
    //       "b_nm": '(주)미리디',
    //       "corp_no": '',
    //       "b_sector": '',
    //       "b_type": '',
    //     }
    //   ],
    // });
    request
        .checkRegistrationNumberValidation(validateBusinessDetailREQU)
        .then((v) {
      print('request success ==============================');
      if (v != null) {
        print('request_cnt : ${v.request_cnt}');
        print('valid_cnt   : ${v.valid_cnt}');
        print('status_code : ${v.status_code}');
        print('data : ${v.data!.length}');
        for (var iterator in v.data!) {
          print('b_no               : ${iterator.status?.b_no}');
          print('b_stt              : ${iterator.status?.b_stt}');
          print('b_stt_cd           : ${iterator.status?.b_stt_cd}');
          print('tax_type           : ${iterator.status?.tax_type}');
          print('tax_type_cd        : ${iterator.status?.tax_type_cd}');
          print('end_dt             : ${iterator.status?.end_dt}');
          print('utcc_yn            : ${iterator.status?.utcc_yn}');
          print('tax_type_change_dt : ${iterator.status?.tax_type_change_dt}');
          print('invoice_apply_dt   : ${iterator.status?.invoice_apply_dt}');
        }
        setState(() {
          registrationNumber_sta.clear();
          registrationNumber_mid.clear();
          registrationNumber_end.clear();
          startDate.clear();
          ownerName.clear();
          companyName.clear();
        });

        resultBottomSheet(v);
      }
    });
  }

  resultBottomSheet(ValidateBusinessDetailRESP res) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        builder: (BuildContext context) {
          return Container(
            height: 200,
            color: Colors.transparent,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UIH()
                      .cTex
                      .text('사업자등록번호 : ${res.data![0].status!.b_no!}', 13),
                  UIH().cTex.text('납세자상태 : ${res.data![0].status!.b_stt!}', 13),
                  UIH()
                      .cTex
                      .text('납세자상태코드 : ${res.data![0].status!.b_stt_cd!}', 13),
                  UIH()
                      .cTex
                      .text('과제유형메시지 : ${res.data![0].status!.tax_type!}', 13),
                  UIH().cTex.text(
                      '과제유형코드 : ${res.data![0].status!.tax_type_cd!}', 13),
                  UIH().cTex.text('폐업일 : ${res.data![0].status!.end_dt!}', 13),
                  UIH().cTex.text(
                      '단위과세전환폐업여부 : ${res.data![0].status!.utcc_yn!}', 13),
                  UIH().cTex.text(
                      '최근과세유형전환일자 : ${res.data![0].status!.tax_type_change_dt!}',
                      13),
                  UIH().cTex.text(
                      '세금계산서적용일자 : ${res.data![0].status!.invoice_apply_dt!}',
                      13),
                ],
              ),
            ),
          );
        });
  }
}

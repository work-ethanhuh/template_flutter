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
  TextEditingController registrationNumber = TextEditingController();
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
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UIH().cBox.box_H(
                  UIH().cTex.weightText(
                      'Public Data Portal API', 20, FontWeight.w400),
                  currentWidth,
                  60),
              // UIH().cBox.box(UIH().cTex.text('$login_info', 10), currentWidth),
              UIH().cDis.divider_H(30),
              InkWell(
                onTap: () {
                  final request = ExternalClient(BasicClient.publicPortal);
                  ValidateBusinessDetailREQU_businesses
                      validateBusinessDetailREQU_businesses =
                      ValidateBusinessDetailREQU_businesses(
                          b_no: '1138621886',
                          start_dt: '20080530',
                          p_nm: '강창석',
                          b_nm: '(주)미리디');
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
                      .checkRegistrationNumberValidation(
                          validateBusinessDetailREQU)
                      .then((v) {
                    print('request success ==============================');
                    if (v != null) {
                      print('request_cnt : ${v.request_cnt}');
                      print('valid_cnt   : ${v.valid_cnt}');
                      print('status_code : ${v.status_code}');
                      print('data : ${v.data!.length}');
                      for (var iterator in v.data!) {
                        print('b_no               : ${iterator.status!.b_no}');
                        print('b_stt              : ${iterator.status?.b_stt}');
                        print(
                            'b_stt_cd           : ${iterator.status?.b_stt_cd}');
                        print(
                            'tax_type           : ${iterator.status?.tax_type}');
                        print(
                            'tax_type_cd        : ${iterator.status?.tax_type_cd}');
                        print(
                            'end_dt             : ${iterator.status?.end_dt}');
                        print(
                            'utcc_yn            : ${iterator.status?.utcc_yn}');
                        print(
                            'tax_type_change_dt : ${iterator.status?.tax_type_change_dt}');
                        print(
                            'invoice_apply_dt   : ${iterator.status?.invoice_apply_dt}');
                      }
                    }
                  });
                },
                child: UIH().cBox.rounded(
                    UIH().cTex.colorText('Check Validation', 20, Colors.white),
                    currentWidth,
                    40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

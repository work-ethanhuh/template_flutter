import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_flutter/api/basic_client.dart';
import 'package:template_flutter/api/fcm_client.dart';
import 'package:template_flutter/api/fixed_key.dart';
import 'package:template_flutter/common/config.dart';
import 'package:template_flutter/common/cv.dart';
import 'package:template_flutter/data_package/request/fcm_send_requ.dart';
import 'package:template_flutter/util/ui_helper.dart';
import 'package:http/http.dart' as http;

class Exam3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Exam3State();
  }
}

class Exam3State extends State<Exam3> {
  TextEditingController textEditingController_title = TextEditingController();
  TextEditingController textEditingController_body = TextEditingController();
  int messageCount = 0;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    initialSequence();
  }

  initialSequence() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      int count = Provider.of<CV>(context, listen: false).list_FCM.length + 1;
      messageCount = count;
      textEditingController_title.text = 'test title $count';
      textEditingController_body.text = 'test body $count';
    });
  }

  @override
  void dispose() {
    textEditingController_title.dispose();
    textEditingController_body.dispose();
    scrollController.dispose();
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
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                UIH().cDis.divider_H(5.0),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: UIH().cTex.text('Title', 15),
                ),
                UIH().cBox.rounded_H(
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: textEditingController_title,
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'input title',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                    MediaQuery.of(context).size.width,
                    80),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: UIH().cTex.text('Body', 15),
                ),
                UIH().cBox.rounded_H(
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextField(
                        controller: textEditingController_body,
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: 'input body',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                    MediaQuery.of(context).size.width,
                    80),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (context.read<CV>().list_FCM.length <= 0 ||
                          context.read<CV>().list_FCM.length == null) {
                        UIH().cDis.toast('Empty FCM List');
                        return;
                      }
                      var dialogWidth = MediaQuery.of(context).size.width * 0.6;
                      var dialogHeight =
                          MediaQuery.of(context).size.height * 0.4;
                      print('width : $dialogWidth');
                      print('height : $dialogHeight');
                      UIH().cDis.dialog(context, dialogWidth, dialogHeight,
                          inBody: ListView.builder(
                            controller: scrollController,
                            itemCount: context.read<CV>().list_FCM.length,
                            itemBuilder: ((context, index) {
                              return UIH().cBox.roundedPadding(
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          '${context.read<CV>().list_FCM.elementAt(index).title}'),
                                      Text(
                                          '${context.read<CV>().list_FCM.elementAt(index).body}'),
                                    ],
                                  ),
                                  dialogWidth - 50,
                                  80,
                                  5);
                            }),
                          ));
                    },
                    child: UIH().cBox.rounded(
                          UIH().cTex.weightText(
                              'Check FCM Stack', 15, FontWeight.w300),
                          // ListView.builder(
                          //     controller: scrollController,
                          //     itemCount: context.watch<CV>().list_FCM.length,
                          //     itemBuilder: ((context, index) {
                          //       return UIH().cBox.roundedPadding(
                          //           Column(
                          //             mainAxisAlignment: MainAxisAlignment.center,
                          //             children: [
                          //               Text(
                          //                   '${context.read<CV>().list_FCM.elementAt(index).title}'),
                          //               Text(
                          //                   '${context.read<CV>().list_FCM.elementAt(index).body}'),
                          //             ],
                          //           ),
                          //           MediaQuery.of(context).size.width,
                          //           80,
                          //           5);
                          //     })),
                          MediaQuery.of(context).size.width,
                        ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // var encode = jsonEncode(<String, dynamic>{
                    //   'to': context.read<CV>().FCM_Token,
                    //   'notification': <String, dynamic>{
                    //     'title': textEditingController_title.text,
                    //     'body': textEditingController_body.text,
                    //     "content_available": true,
                    //     "mutable_content": true,
                    //   },
                    // });
                    // var url = DefinedAPI.FCM + '/fcm/send';
                    // print(url);
                    // print(FIXEDKEY.CLOUD_MESSAGING);
                    // print('encode : $encode');

                    final request = FCMClient(BasicClient.FCM);
                    FCMSendREQU_notification sendREQU_notification =
                        FCMSendREQU_notification(
                            title: textEditingController_title.text,
                            body: textEditingController_body.text);
                    FCMSendREQU sendREQU = FCMSendREQU(
                        to: context.read<CV>().FCM_Token,
                        notification: sendREQU_notification);
                    request.sendPushMessage(sendREQU).then((v) {
                      print('success');

                      messageCount++;
                      setState(() {
                        textEditingController_title.text =
                            'test title $messageCount';
                        textEditingController_body.text =
                            'test body $messageCount';
                      });
                    });
                  },
                  child: UIH().cBox.rounded_H(
                      UIH()
                          .cTex
                          .colorText('Send Cloud Messaging', 20, Colors.white),
                      MediaQuery.of(context).size.width,
                      40),
                ),
              ],
            ),
          ),
        ));
  }
}

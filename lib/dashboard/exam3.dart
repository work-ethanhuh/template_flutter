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
                UIH().cBox.rounded(
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
                UIH().cBox.rounded(
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
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: UIH().cTex.text(
                      'Message Count +${context.read<CV>().list_FCM.length}',
                      15),
                ),
                Expanded(
                  child: UIH().cBox.box(
                        ListView.builder(
                            controller: scrollController,
                            itemCount: context.watch<CV>().list_FCM.length,
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
                                  MediaQuery.of(context).size.width,
                                  80,
                                  5);
                            })),
                        MediaQuery.of(context).size.width,
                      ),
                ),
                InkWell(
                  onTap: () {
                    // final request = FCMClient(BasicClient.FCM);
                    // FCMSendREQU_message_notification sendREQU_message_notification =
                    //     FCMSendREQU_message_notification(
                    //         title: 'test title', body: 'test body');
                    // FCMSendREQU_message sendREQU_message = FCMSendREQU_message(
                    //     notification: sendREQU_message_notification,
                    //     to: context.read<CV>().FCM_Token,
                    //     time_to_live: 0,
                    //     delay_while_idle: true);
                    // FCMSendREQU_AOS sendREQU_AOS =
                    //     FCMSendREQU_AOS(message: sendREQU_message);

                    var encode = jsonEncode(<String, dynamic>{
                      'to': context.read<CV>().FCM_Token,
                      'notification': <String, dynamic>{
                        'title': textEditingController_title.text,
                        'body': textEditingController_body.text,
                        "content_available": true,
                        "mutable_content": true,
                      },
                    });
                    var url = DefinedAPI.FCM + '/fcm/send';
                    print(url);
                    print(FIXEDKEY.CLOUD_MESSAGING);
                    print('encode : $encode');
                    Timer(Duration(seconds: 5), () async {
                      try {
                        http.Response response = await http.post(
                          Uri.parse(url),
                          headers: <String, String>{
                            'Content-Type': 'application/json',
                            'Authorization': 'key=${FIXEDKEY.CLOUD_MESSAGING}',
                          },
                          body: encode,
                        );

                        int statusCode = response.statusCode;
                        if (statusCode == 200) {
                          print('success');
                          print(response.body);
                          messageCount++;
                          setState(() {
                            textEditingController_title.text =
                                'test title $messageCount';
                            textEditingController_body.text =
                                'test body $messageCount';
                          });
                        } else {
                          print('fail');
                          print(response.statusCode);
                        }
                      } catch (e) {
                        print('error : $e');
                      }
                    });

                    // request.sendPushMessageAOS(sendREQU_AOS).then((value) {
                    //   print(value.toString());
                    // });
                  },
                  child: UIH().cBox.rounded(
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
